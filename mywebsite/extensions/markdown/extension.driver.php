<?php

	Class extension_Markdown extends Extension{

		public function update($previousVersion = false){
			if(version_compare($previousVersion, '1.10', '<')){

				$conversion = array(
					'pb_markdown' => 'markdown',
					'pb_markdownextrasmartypants' => 'markdown_extra_with_smartypants',
					'pb_markdownextra' => 'markdown_extra'
				);

				foreach($conversion as $old => $new){

					try{
						Symphony::Database()->query(
							sprintf("UPDATE `tbl_fields_textarea` SET `formatter` = '%s' WHERE `formatter` = '%s'", $new, $old)
						);
					}
					catch(Exception $e){
					}

					try{
						Symphony::Database()->query(
							sprintf("UPDATE `tbl_fields_textbox` SET `text_formatter` = '%s' WHERE `text_formatter` = '%s'", $new, $old)
						);
					}
					catch(Exception $e){
					}

				}

			}

			return true;
		}

	}
