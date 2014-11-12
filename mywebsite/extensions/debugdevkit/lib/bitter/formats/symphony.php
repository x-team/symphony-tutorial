<?php
/*----------------------------------------------------------------------------*/
	
	class BitterFormatSymphony extends BitterFormat {
		protected $tabsize = 4;
		protected $line = 1;
		protected $output = '';
		
		public function process($source) {
			$this->output = $source;
			
			$this->processTabs();
			$this->processLines();
			
			return sprintf(
				'<pre>%s</pre>',
				$this->output
			);
		}
		
		protected function processTabs() {
			// first split the output into manageable chunks
			$lines = explode(PHP_EOL, $this->output);
			$linesCount = count($lines);
			// fix lines one by one
			for ($x = 0; $x < $linesCount; $x++) {
				// while there are still tabs
				while (strpos($lines[$x], "\t") !== FALSE) {
					// replace tabs for spaces
					$lines[$x] = preg_replace_callback('%^([^\t]*)([\t]+)%', array($this, 'processTabsLine'), $lines[$x]);
				}
			}
			// concat the final output
			$this->output = implode(PHP_EOL, $lines);
		}
		
		protected function processTabsLine($matches) {
			return $matches[1] . str_repeat(
				' ', strlen($matches[2]) * $this->tabsize
			);
		}
		
		protected function processLines() {
			$tokens = preg_split('%(<span class=".*?">|</span>)%', $this->output, 0, PREG_SPLIT_DELIM_CAPTURE);
			$stack = array(); $this->output = '';
			
			$this->startLine();
			
			foreach ($tokens as $token) {
				// Close:
				if (preg_match('%^</%', $token)) {
					array_pop($stack);
					$this->output .= $token;
				}
				
				// Open:
				else if (preg_match('%^<%', $token)) {
					array_push($stack, $token);
					$this->output .= $token;
				}
				
				else {
					$characters = preg_split('//', $token);
					
					foreach ($characters as $character) {
						if ($character == "\n") {
							$this->endLine();
							
							foreach ($stack as $alt_token) $this->output .= '</span>';
						}
						
						$this->output .= $character;
						
						if ($character == "\n") {
							$this->startLine();
							
							foreach ($stack as $alt_token) $this->output .= $alt_token;
						}
					}
				}
			}
			
			$this->endLine();
		}
		
		protected function startLine() {
			$this->output .= "<line id=\"{$this->line}\">";
			$this->output .= "<marker></marker>";
			$this->output .= "<content>";
		}
		
		protected function endLine() {
			$this->line++;
			$this->output .= '</content>';
			$this->output .= '</line>';
		}
	}
	
/*----------------------------------------------------------------------------*/
	
	return new BitterFormatSymphony();
	
/*----------------------------------------------------------------------------*/
?>