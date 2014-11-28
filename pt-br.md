Sistema de Gerenciamento de Conteúdo PHP 
=====

Neste tutorial você aprenderá como instalar e construir um site administrável a partir do início. Essa ferramenta oferece uma forma extensível de melhorar a si mesma e entregar os dados para a camada de template. A camada de template é o frontend do seu projeto, e lá é só código!

Discussão: http://www.getsymphony.com/discuss/thread/109020/

[Como usar este projeto](#07-sua-vez)

- [01. Setup do ambiente](#01-setup-do-ambiente)
- [02. Instalação do Symphony CMS](#02-instalacao-do-symphony-cms)
  - [I. Git clone](#i-git-clone)
  - [II. Assistente de instalação](#ii-assistente-de-instalacao)
  - [III. Ok!](#iii-ok)
- [03. Administração do Symphony](#03-administracao-do-symphony)
  - [I. Login](#i-login)
  - [II. Página administrativa](#ii-pagina-administrativa)
  - [III. Extensões Symphony](#iii-extensoes-symphony)
  - [IV. Estrutura de arquivos](#iv-estruturas-de-arquivos)
- [04. Mywebsite backend](#04-mywebsite-backend)
  - [I. Trabalhando com seções](#i-trabalhando-com-secoes)
  - [II. Trabalhando com data-sources](#ii-trabalhando-com-data-sources)
  - [III. Trabalhando com páginas](#iii-trabalhando-com-paginas)
- [05. Mywebsite frontend](#05-mywebsite-frontend)
  - [I. Homepage](#i-homepage)
  - [II. Nova Página](#ii-nova-pagina)
  - [III. Melhorando a marcação HTML](#iii-melhorando-o-resultado)
- [06. Conjunto Mywebsite](#06-mywebsite-ensemble)
- [07. Sua vez!](#07-sua-vez)
- [Sobre Symphony CMS](#about-symphony-cms)


O resultado deste tutorial pode ser visto no ~1h do desenvolvimento.

Abra uma issue se tiver alguma dúvida. Boa leitura!


01. Preparação do ambiente
-----

Para programar com Symphony você precisa se certificar que seu servidor atende aos seguintes requisitos:

- PHP 5.3 ou superior
- Módulo LibXML do PHP, com a extensão XSLT ativa (--with-xsl)
- MySQL 5.0 ou superior
- Um servidor Apache (outros podem ser usados, mas manteremos o foco no Apache neste tutorial)
- Módulo mod_rewrite do PHP ou equivalente

> Para Windows, tente [XAMPP](https://www.apachefriends.org/index.html), vai ter tudo que você precisa na instalação padrão.



02. Instalação do Symphony CMS
-----

_Antes de começar, tenha certeza de que entendeu que **SymphonyCMS** NÃO é a mesma coisa que **Symfony PHP Framework**. Está pronto?_ :)

Instalar o Symphony é muito fácil. Nesse tutorial nós usaremos `git` para todas as tarefas de manipulação de dependências, mas esta tarefa tambem funciona com arquivos `.zip` (confira em http://www.getsymphony.com/download/, para uma instalação em branco remova a pasta `/workspace` antes da instalação).

### I. Git clone

Primeiro passo, vá a [github.com/symphonycms/symphony-2](http://github.com/symphonycms/symphony-2) e clone o projeto no seu servidor.

![github.com/symphonycms/symphony-2](screenshots/02-github.symphony.png)

`git clone https://github.com/symphonycms/symphony-2.git mywebsite`

Com o sistema de arquivos clonado, abra seu projeto no navegador [http://localhost/mywebsite/](http://localhost/mywebsite/).

_Não usaremos hosts virtuais neste tutorial para mantê-lo simples. Como `http://localhost` é a raiz do seu servidor Apache, `/mywebsite` deve ficar ali._

### II. Assistente de instalação

Em __mywebsite__ você verá o Assistente de Instalação (Install Wizard). Esta página é muito informativa, por isso, preencha todos os campos. Finalmente, clique em `Install Symphony`. Você vai precisar de um DB para este projeto, então certifique-se de que criou um com a ferramenta MySQL de sua preferência.

![localhost/mywebsite/install](screenshots/03-install.png)

### III. Pronto!

Tudo instalado, vamos lá!

![localhost/mywebsite/install](screenshots/04-installed.png)


03. Administração do Symphony
-----

### I. Login

Agora, vá à sua página administrativa. Neste tutorial usaremos o caminho padrão `/symphony`, mas como você viu na instalação, pode-se escolher um caminho diferente.

![localhost/mywebsite/symphony](screenshots/05-login.png)

### II. Página Administrativa

Após o login, você verá uma página administrativa bonita e limpa.

![localhost/mywebsite/symphony](screenshots/06-symphony-admin.png)

No Symphony nós temos conceitos muito bem definidos para criar grandiosidades. Explicaremos o básico e você pode ler mais no Site Oficial do Symphony em [concepts](http://www.getsymphony.com/learn/concepts/).

As ferramentas de desenvolvimento estão em duas seções no lado direito do menu principal: __Blueprints__ e __System__. Neste momento não temos nada do conteúdo do site. Como um papel em branco, vamos construir com base apenas na nossa especificação do projeto. Esta é uma grande diferença no approach comparada com outros CMSs.

```
- Blueprints
  - Pages
  - Sections
  - Data Sources
  - Events
- System
  - Authors
  - Preferences
  - Extensions
```

Na página Symphony [learn](http://www.getsymphony.com/learn/), o infográfico a seguir explica muita coisa sobre como o Symphony trabalha!

![visual-overview](screenshots/07-visual-overview.png)

### III. Extensões Symphony

É importante entender que Symphony foi concebido para ser simples e possui um poderoso núcleo para ser extendido pela comunidade. Para isto, temos toneladas de extensões para qualquer necessidade. O núcleo tem o essencial mas, para nosso tutorial, iremos mais longe. Instalaremos extensões à medida que precisarmos para evoluir no tutorial.

O repositório oficial das extensões pode ser encontrado no site [extensions](http://www.getsymphony.com/download/extensions/), seção do Symphony website. Embora o website oficial esteja cheio de recursos, alguns anos atrás, [@nickdunn](http://twitter.com/nickdunn) contruiu um repositório ainda melhor chamado [symphonyextensions.com](http://symphonyextensions.com/). Usaremos este neste tutorial.

![symphony-extensions](screenshots/08-symphonyextensions.png)

### IV. Estrutura de Arquivos

```
mywebsite
├── extensions (todas extensões ficarão aqui)
├── install (arquivos de instalação, por questões de segurança, é recomendável deletar isto após a instalação)
├── manifest (arquivos de material, cache, log, temp e o config.php, este é o tipo de pasta a ser incluída no .gitignore)
├── symphony (os arquivos de sistema SymphonyCMS)
└── workspace (aqui está toda diversão, seu projeto estará aqui e você trabalhará a maior parte do tempo aqui)
    ├── data-sources (cada data source é um arquivo PHP daqui)
    ├── events (cada evento é um arquivo PHP daqui)
    ├── pages (cada página é um XSL daqui)
    └── utilities (você pode usar esta página para incluir todos templates XSL úteis no seu projeto)
```

04. Mywebsite backend
-----

Hora de começar a diversão. Primeiro de tudo, precisamos entender o que estamos fazendo. Vamos imaginar um site super simples, com uma estrutura de conteúdo mais ou menos assim:

```
- Notícias
  - Título (um campo de texto de uma linha)
  - Data (campo de data)
  - Texto (textarea com markdown)
  - Autor (autor pelo admin)
  - Imagens (galeria de imagens)
```

### I. Trabalhando com Seções

#### a) Criando uma nova seção

Vá a `Blueprints > Sections > Create new` e crie uma seção __Notícias__ como a seguir:

![news-section](screenshots/09-create-news-section.png)

Neste momento não estamos usando nenhuma extensão, vamos apenas criar os campos básicos para a __News section__.

Agora precisamos de um formatador Markdown para o __Text field__. No terminal, vá à pasta raiz do projeto e rode:

`git submodule add https://github.com/symphonycms/markdown.git extensions/markdown --recursive`

_(mais informações sobre esta extensão, aqui: [Markdown Text Formatter](http://symphonyextensions.com/extensions/markdown/))_

De volta à administração, vá até `System > Extensions`, selecione `Markdown Text Formatter` e, na selectbox no canto inferior-direito, escolha `Install` e clique em `Apply`.

![install-markdown-extension](screenshots/10-install-markdown-extension.png)

Volte ao `Blueprints > Sections`, clique em `News` e marque o `Text Formatter` no __Text field__ para `Markdown` e `Save changes`.

![apply-markdown](screenshots/11-apply-markdown.png)

#### b) Preenchendo seção News com conteúdo de exemplo

Neste momento, você já pode ver a seção criada recentemente no lado esquerdo, no menu principal. O próximo passo é criar algum conteúdo nesta seção.

Vá para `Content > News` e você verá uma lista vazia de entradas. Clique no botão verde `Create New`.

![creating-content](screenshots/12-creating-content.png)

Agora você vai começar a entender porque eu amo a interface do Symphony: é realmente simples!

![content-created](screenshots/13-content-created.png)

Depois de criar algum conteúdo de exemplo, você poderá ver as listas de tipos de entradas que quiser. Isto não afeta nada no frontend, voltaremos a isso em breve.

![news-section](screenshots/14-news-section.png)

#### c) Criando a Seção Imagens (seções vinculadas)

Você deve ter percebido que não é possível criar nenhum campo de imagem no __News section__. Percebeu? Uau, você está prestando atenção :)

Agora vamos criar uma seção __Images__ com alguma meta informação como __caption__ e __credits__. Mas antes precisamos criar uma nova pasta para "upar" todos arquivos de imagem desta seção. No terminal, digite `mkdir workspace/uploads && mkdir workspace/uploads/images`.

Para esta seção, vamos precisar de mais duas extensões. para instalar, rode:

`git submodule add https://github.com/symphonycms/selectbox_link_field.git extensions/selectbox_link_field --recursive`

_(mais informação em [Selectbox Link Field](http://symphonyextensions.com/extensions/selectbox_link_field/))_

`git submodule add https://github.com/symphonists/order_entries.git extensions/order_entries --recursive`

_(mais informação em [Order Entries](http://symphonyextensions.com/extensions/order_entries/))_

Agora, vá para `System > Extensions` e instale ambas. O __Selectbox Link Field__ proverá um novo tipo de campo que será utilizado para  "linkar" uma seção a outra. O __Order Entries__ também é um novo tipo para habilitar a escolha de entradas, arrastando as linhas na lista de entradas.

![install-sbl-and-order-extensions](screenshots/15-install-sbl-and-order-extensions.png)

Agora, vá a `Blueprints > Sections` and `Create New` section:

![creating-images-section](screenshots/16-creating-images-section.png)

Depois de criar o __Images sections__, vá a `Content > News`. Viu a nova coluna chamada `Images` no lado direito? Clique no link `0 →` de qualquer entrada para criar um conteúdo de exemplo vinculado a esta entrada.

![linked-section](screenshots/17-linked-section.png)

#### d) Preenchendo a seção Images com conteúdo de exemplo

Criar conteúdo é realmente simples, como vimos antes. Nada de novo aqui também.

Depois de criar algum conteúdo de exemplo, repare na coluna __Images__ da lista de entrada __News Section__. Você verá algo como `5 →`. Este link leva à lista de entradas __Image Section__, filtrada para mostrar apenas entradas válidas.

![images-section](screenshots/18-images-section.png)

### II. Trabalhando com Data Sources

Até agora, tudo bem! Neste ponto, já temos uma interface  administrativa para material CRUD/BREAD. Agora nós vamos para Data Sources!

Data Sources são filtros para buscar entradas nas seções sob demanda. Para criar uma nova Data Source vá a `Blueprints > Data Sources > Create New`.

Antes de continuar, precisamos ter uma ideia de como queremos o frontend. Então vamos imaginar as seguintes especificações: Na homepage de __mywebsite__ eu quero ver uma lista de todas notícias com links para a página de notícias. Na lista, as notícias devem estar ordenadas por data (mais recentes primeiro) com data e título. Na página de notícias, quero ver todas as informações da notícia.

Para fazer isto, precisamos de um pequeno Data Source. Vá a `Blueprints > Data Sources > Create New` e crie o seguinte:

- List News (busca todas notícias, ordenada por data decrescente)
- Current News (busca apenas notícias atuais)
- News Images (busca todas imagens das notícias atuais, ordenado pelo campo tipo decrescente)

#### a) List News

- Selecione __News__ e ordene por data decrescente.
- Desative a paginação para pesquisar todas entradas.
- Selecione apenas os campos título e data para a saída.

![list-news-datasource](screenshots/19-list-news-datasource.png)

#### b) Current News

- Selecione __News__ e defina a condição co o parâmetro necessário `$title`.
- Se esta condição retornar false, redireciona para página 404.
- Filtre pelo __Title field__ com parâmetro `$title`.
- Desative a paginação para pesquisar todas entradas.
- Selecione apenas título, data, autor e texto (formatado) para a saída.
- Tente também o parâmetro `$ds-current-news.system-id`.

_Não tem certeza de onde o parâmetro `$title` vem? Aguarde, veremos no próximo capítulo!_

![current-news-datasource](screenshots/20-current-news-datasource.png)

#### c) News Images

- Selecione __Images__.
- Filtre pelo __News field__ (o link do campo Selectbox) com o parâmetro `$ds-current-news.system-id` de __Current News__ Data Source. Isto é chamado de uma cadeia de datasources.
- Ordene por __Sort order field__ decrescente.
- Desative a paginação para pesquisar todas entradas.
- Selecione apenas campos legendas, créditos e imagem para a saída.

![news-images-datasource](screenshots/21-news-images-datasource.png)

#### d) List of Data Sources

Isto é como `Blueprints > Data Sources` aparece agora:

![list-of-datasources](screenshots/22-datasources.png)

### III. Trabalhando com Páginas

Agora é hora de criar as rotas e anexar data sources. Seguindo as especificações, temos duas páginas: __Homepage__ e __News__.

#### a) Homepage

Vamos criar a __Homepage__ primeiro. Esta página é apenas uma com __Type__ `index`. Para fazer isto, vá a `Blueprints > Pages`. Uma vez criada, podemos também anexar __List News__ Data Source nesta página.

![creating-homepage](screenshots/23-creating-homepage.png)

#### b) News

Quando criada a __News page__ definiremos o __Parameters__ com valor `title`. Este parâmetro é o `$title` usado no __Current News__ Data Source. Anexaremos também __Current News__ e __News Images__ Data Sources nesta página.

![creating-news](screenshots/24-creating-news.png)

#### c) List of Pages

Agora, temos `Blueprints > Pages` assim:

![list-of-pages](screenshots/25-pages.png)


05. Mywebsite frontend
-----

Agora vamos começar o frontend!

Symphony recupera os dados do Data Source como o XML e transforma em HTML usando XSLT. XSLT é uma linguagem de mecanismo de templates que é muito fácil de aprender depois que se aprendeu o básico. Eu vou mostrar como começar.

Primeira coisa que precisamos agora é instalar as extensões [Debug Devkit](http://symphonyextensions.com/extensions/debugdevkit/) para ver o que está por detrás do capô destas páginas.

`git submodule add https://github.com/symphonycms/debugdevkit.git extensions/debugdevkit --recursive`

### I. Homepage

Agora abra nossa homepage [`http://localhost/mywebsite`](http://localhost/mywebsite)!

Você verá apenas uma página com um `<h1>` para o título da página. Perfeito! Abra o `/workspace/pages/homepage.xsl` e verá o seguinte:

#### a) homepage.xsl padrão

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:template match="/">
  <h1><xsl:value-of select="/data/params/page-title"/></h1>
</xsl:template>

</xsl:stylesheet>
```

#### b) Homepage `?debug`

Agora abra o debug devkit adding `?debug` na URL [`http://localhost/mywebsite/?debug`](http://localhost/mywebsite/?debug), e na aba XML será exibido o seguinte:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<data>
    <params>
        <today>2014-11-05</today>
        <current-time>22:47</current-time>
        <this-year>2014</this-year>
        <this-month>11</this-month>
        <this-day>05</this-day>
        <timezone>-02:00</timezone>
        <website-name>Mywebsite</website-name>
        <page-title>Homepage</page-title>
        <root>http://localhost/mywebsite</root>
        <workspace>http://localhost/mywebsite/workspace</workspace>
        <http-host>localhost</http-host>
        <root-page>homepage</root-page>
        <current-page>homepage</current-page>
        <current-page-id>1</current-page-id>
        <current-path>/</current-path>
        <parent-path>/</parent-path>
        <current-query-string><![CDATA[debug]]></current-query-string>
        <current-url>http://localhost/mywebsite</current-url>
        <upload-limit>5242880</upload-limit>
        <symphony-version>2.5.1</symphony-version>
        <cookie-xsrf-token>5N/oAkCRtT8xqfarmBUlR2l/5Sg</cookie-xsrf-token>
        <cookie-username>bernardo</cookie-username>
        <cookie-pass>PBKDF2v1|10000|d9b1ac45e1f9ab5ad3ee|9YBlZEEMSI0/95e7PIDmJFPXtfxh5k/600rk5ppPdxMO9HHRNUy0Ag==</cookie-pass>
        <page-types>
            <item handle="index">index</item>
        </page-types>
        <page-events></page-events>
    </params>
    <events />
    <list-news>
        <section id="1" handle="news">News</section>
        <entry id="4">
            <title handle="vestibulum-nec-facilisis-augue">Vestibulum nec facilisis augue</title>
            <date iso="2014-11-02T14:18:00-02:00" timestamp="1414945080" time="14:18" weekday="7" offset="-0200">2014-11-02</date>
        </entry>
        <entry id="5">
            <title handle="praesent-dui-lorem">Praesent dui lorem</title>
            <date iso="2014-11-02T14:18:00-02:00" timestamp="1414945080" time="14:18" weekday="7" offset="-0200">2014-11-02</date>
        </entry>
        <entry id="2">
            <title handle="proin-eu-sagittis-diam">Proin eu sagittis diam</title>
            <date iso="2014-11-02T14:17:00-02:00" timestamp="1414945020" time="14:17" weekday="7" offset="-0200">2014-11-02</date>
        </entry>
        <entry id="3">
            <title handle="nullam-commodo-metus-a-felis-pharetra-faucibus">Nullam commodo metus a felis pharetra faucibus</title>
            <date iso="2014-11-02T14:17:00-02:00" timestamp="1414945020" time="14:17" weekday="7" offset="-0200">2014-11-02</date>
        </entry>
        <entry id="1">
            <title handle="lorem-ipsum-dolor-sit-amet">Lorem ipsum dolor sit amet</title>
            <date iso="2014-11-02T14:15:00-02:00" timestamp="1414944900" time="14:15" weekday="7" offset="-0200">2014-11-02</date>
        </entry>
    </list-news>
</data>
```

![debug-devkit](screenshots/26-debugdevkit.png)

#### c) homepage.xsl editada

O que importa aqui é o nó `<list-news>`, que é o resultado da [List News](#a-list-news) Data Source. Agora, vamos fazer uma lista com estes dados usando __XPath__ no `/workspace/pages/homepage.xsl`, e o arquivo parecerá com isto:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:template match="/">
  <ul>
    <xsl:for-each select="data/list-news/entry">
      <li>
        <a href="{/data/params/root}/news/{title/@handle}"><xsl:value-of select="title"/></a>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

</xsl:stylesheet>
```

#### c) Saída da Homepage 

E o HTML de saída será:

```html
<!DOCTYPE ul PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<ul>
  <li>
    <a href="http://localhost/mywebsite/news/vestibulum-nec-facilisis-augue">Vestibulum nec facilisis augue</a>
  </li>
  <li>
    <a href="http://localhost/mywebsite/news/praesent-dui-lorem">Praesent dui lorem</a>
  </li>
  <li>
    <a href="http://localhost/mywebsite/news/proin-eu-sagittis-diam">Proin eu sagittis diam</a>
  </li>
  <li>
    <a href="http://localhost/mywebsite/news/nullam-commodo-metus-a-felis-pharetra-faucibus">Nullam commodo metus a felis pharetra faucibus</a>
  </li>
  <li>
    <a href="http://localhost/mywebsite/news/lorem-ipsum-dolor-sit-amet">Lorem ipsum dolor sit amet</a>
  </li>
</ul>
```

![homepage-result](screenshots/27-homepage-result.png)

### II. Página de Notícias

Clicando em qualquer um dos links, vai para página __News__, que é o arquivo `/workspace/pages/news.xsl`. Vamos ver o que temos no XML anexado a esta página. Clique em qualquer link e adicione `?debug` na URL [`http://localhost/mywebsite/news/vestibulum-nec-facilisis-augue/?debug`](http://localhost/mywebsite/news/vestibulum-nec-facilisis-augue/?debug):

#### a) Página de Notícias ?debug

```xml
<?xml version="1.0" encoding="utf-8" ?>
<data>
    <params>
        <today>2014-11-05</today>
        <current-time>23:24</current-time>
        <this-year>2014</this-year>
        <this-month>11</this-month>
        <this-day>05</this-day>
        <timezone>-02:00</timezone>
        <website-name>Mywebsite</website-name>
        <page-title>News</page-title>
        <root>http://localhost/mywebsite</root>
        <workspace>http://localhost/mywebsite/workspace</workspace>
        <http-host>localhost</http-host>
        <root-page>news</root-page>
        <current-page>news</current-page>
        <current-page-id>2</current-page-id>
        <current-path>/news/praesent-dui-lorem</current-path>
        <parent-path>/</parent-path>
        <current-query-string><![CDATA[debug]]></current-query-string>
        <current-url>http://localhost/mywebsite/news/praesent-dui-lorem</current-url>
        <upload-limit>5242880</upload-limit>
        <symphony-version>2.5.1</symphony-version>
        <title>praesent-dui-lorem</title>
        <cookie-xsrf-token>5N/oAkCRtT8xqfarmBUlR2l/5Sg</cookie-xsrf-token>
        <cookie-username>bernardo</cookie-username>
        <cookie-pass>PBKDF2v1|10000|d9b1ac45e1f9ab5ad3ee|9YBlZEEMSI0/95e7PIDmJFPXtfxh5k/600rk5ppPdxMO9HHRNUy0Ag==</cookie-pass>
        <page-types />
        <page-events></page-events>
        <ds-current-news.system-id>
            <item handle="5">5</item>
        </ds-current-news.system-id>
        <ds-current-news>
            <item handle="5">5</item>
        </ds-current-news>
    </params>
    <events />
    <current-news>
        <section id="1" handle="news">News</section>
        <entry id="5">
            <title handle="praesent-dui-lorem">Praesent dui lorem</title>
            <date iso="2014-11-02T14:18:00-02:00" timestamp="1414945080" time="14:18" weekday="7" offset="-0200">2014-11-02</date>
            <author>
                <item id="1" handle="bernardo-dias-da-cruz" username="bernardo">Bernardo Dias da Cruz</item>
            </author>
            <text mode="formatted">
                <h1>Yey!</h1>
                <p><strong>Praesent dui lorem</strong>, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.</p>
                <p>Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.</p>
                <p>Proin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.</p>
            </text>
        </entry>
    </current-news>
    <news-images>
        <section id="2" handle="images">Images</section>
        <entry id="12">
            <caption handle="ubatuba">ubatuba</caption>
            <credits handle="andre">andré</credits>
            <image size="77 KB" bytes="79103" path="/uploads/images" type="image/jpeg">
                <filename>10743381_919876464707201_1100897924_n.jpg</filename>
                <meta creation="2014-11-02T15:11:24-02:00" width="960" height="720" />
            </image>
        </entry>
        <entry id="13">
            <caption handle="ubatuba">ubatuba</caption>
            <credits handle="andre">andré</credits>
            <image size="53 KB" bytes="54582" path="/uploads/images" type="image/jpeg">
                <filename>10749555_919876354707212_669708385_n.jpg</filename>
                <meta creation="2014-11-02T15:11:36-02:00" width="960" height="720" />
            </image>
        </entry>
        <entry id="11">
            <caption handle="ubatuba">ubatuba</caption>
            <credits handle="andre">andré</credits>
            <image size="75 KB" bytes="77705" path="/uploads/images" type="image/jpeg">
                <filename>10643250_919876458040535_2051957555_n.jpg</filename>
                <meta creation="2014-11-02T15:11:02-02:00" width="960" height="720" />
            </image>
        </entry>
        <entry id="10">
            <caption handle="ubatuba">ubatuba</caption>
            <credits handle="andre">andré</credits>
            <image size="38 KB" bytes="39575" path="/uploads/images" type="image/jpeg">
                <filename>1063075_919876374707210_1102205846_n.jpg</filename>
                <meta creation="2014-11-02T15:10:35-02:00" width="960" height="720" />
            </image>
        </entry>
        <entry id="9">
            <caption handle="ubatuba">ubatuba</caption>
            <credits handle="andre">andré</credits>
            <image size="127 KB" bytes="130549" path="/uploads/images" type="image/jpeg">
                <filename>974711_919876548040526_1619447394_n.jpg</filename>
                <meta creation="2014-11-02T15:10:30-02:00" width="960" height="720" />
            </image>
        </entry>
    </news-images>
</data>
```

Localizou o `<ds-current-news.system-id>` dentro de `<params>`? Este nó tem uma lista com todos IDs da __Current News__ Data Source. Este é o parâmetro que usanos para vincular e filtrar o __News Images__ Data Source. Abaixo, no XML você verá `<current-news>` e `<news-images>` resultantes do Data Sources, respectivamente.

#### b) news.xsl editado

Após editar o seu `/workspace/pages/news.xsl`, o seu arquivo parecerá com isto:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:template match="/">
  <h1><xsl:value-of select="data/current-news/entry/title"/></h1>
  <p><xsl:value-of select="data/current-news/entry/date"/></p>
  <p><xsl:value-of select="data/current-news/entry/author/item"/></p>
  <xsl:value-of select="data/current-news/entry/text"/>

  <ul>
    <xsl:for-each select="data/news-images/entry">
      <li>
        <img src="{//data/params/workspace}{image/@path}/{image/filename}" width="500" alt=""/>
        <br/>
        <xsl:value-of select="caption"/>
        <br/>
        <xsl:value-of select="credits"/>
        <hr/>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

</xsl:stylesheet>
```
#### b) Saída da Página de Notícias

Yey! Nós temos nossa página de notícias com todo conteúdo vindo do sistema. A saída HTML contém apenas o que você esperaria:

```html
<!DOCTYPE h1 PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<h1>Praesent dui lorem</h1><p>2014-11-02</p><p>Bernardo Dias da Cruz</p>Yey!

Praesent dui lorem, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.

Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.

Proin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.
<ul>
  <li><img src="http://localhost/mywebsite/workspace/uploads/images/10743381_919876464707201_1100897924_n.jpg" width="500" alt="" /><br />ubatuba<br />andré<hr /></li>
  <li><img src="http://localhost/mywebsite/workspace/uploads/images/10749555_919876354707212_669708385_n.jpg" width="500" alt="" /><br />ubatuba<br />andré<hr /></li>
  <li><img src="http://localhost/mywebsite/workspace/uploads/images/10643250_919876458040535_2051957555_n.jpg" width="500" alt="" /><br />ubatuba<br />andré<hr /></li>
  <li><img src="http://localhost/mywebsite/workspace/uploads/images/1063075_919876374707210_1102205846_n.jpg" width="500" alt="" /><br />ubatuba<br />andré<hr /></li>
  <li><img src="http://localhost/mywebsite/workspace/uploads/images/974711_919876548040526_1619447394_n.jpg" width="500" alt="" /><br />ubatuba<br />andré<hr /></li>
</ul>
```

![news-simple-result](screenshots/28-news-simple-result.png)

### III. Melhorando o resultado

Mas espere... A menos que esteja sem estilos (este não é um tutorial CSS, então vamos pular esta parte por enquanto), o formato do conteúdo está errado!!! Bem, meio errado, precisamos aprofundar no XSLT para ver como podemos melhorar isto.

Vamos pegar alguns templates XSLT sa seção do website SymphonyCMS [Utilities](http://www.getsymphony.com/download/xslt-utilities/). Precisamos:

- Corrigir o formato da data,
- Corrigir a saída do texto (devemos ver um HTML ao invés do Markdown),
- Remover o inline width das imagens e redimensioná-las no lado do servidor.

Vamos manipular estas coisas, uma a uma, agora:

#### a) Corrigir o formato da data

Para a data, queremos usar algo como `2nd November, 2014` ao invés de `2014-11-02`. Para fazer isto precisamos de um template de formato de data que pode ser encontrado no website oficial. Na seção __XSLT Utilities__ procure por [Format Date/Time Advanced](http://www.getsymphony.com/download/xslt-utilities/view/20744/).

Copie o raw code em `/workspace/utilities/format-date.xsl` e inclua este arquivo no `/workspace/pages/news.xsl`. Para fazer isto, adicione `<xsl:import href="../utilities/format-date.xsl"/>` antes `<xsl:output ... />` e substitua por:

```xml
<p><xsl:value-of select="data/current-news/entry/date"/></p>
```

inclua o template `format-date` assim:

```xml
<p>
  <xsl:call-template name="format-date">
    <xsl:with-param name="date" select="data/current-news/entry/date"/>
    <xsl:with-param name="format" select="'%d;%ds; %m+;, %y+;'"/>
  </xsl:call-template>
</p>
```

(mais instruções de como usar o template pode ser encontrado no arquivo utility).

#### b) Corrigir a saída do texto (converter Markdown para HTML)

Manipulação de HTML é algo realmente bom de fazer com XSL, porque HTML é compatível com XML. Para realizar isto, Allen Chang escreveu uma boa técnica, que é melhor explicada no artigo [HTML Ninja Technique](http://www.getsymphony.com/learn/articles/view/html-ninja-technique/).

Faremos o mesmo que fizemos com o utilitário __Format Date__: criar um arquivo utilitário com [HTML Manipulation](http://www.getsymphony.com/download/xslt-utilities/view/20035/) e importar para o arquivo da página.

Para usar este template, apenas mude `<xsl:value-of select="data/current-news/entry/text"/>` para `<xsl:apply-templates select="data/current-news/entry/text/*" mode="html"/>`.

Em __mywebsite__, já usamos a tag `h1` e no exemplo acima nós também temos um `h1` no texto em Markdown. A "Ninja technique" é um poderoso meio para manipular todo conteúdo HTML do XML. O ninja template utility inclui o seguinte template:

```xml
<xsl:template match="h1 | h2 | h3 | h4" mode="html" priority="1">
  <xsl:param name="level" select="1" />
  
  <xsl:element name="h{substring-after(name(), 'h') + $level}">
    <xsl:apply-templates select="* | @* | text()" mode="html" />
  </xsl:element>
</xsl:template>
```

e todos headers serão mudados um nível a seguir.


#### c) Remover a inline width de imagens e redimesioná-las no lado do servidor.

Esta é uma boa característica para se ter em um CMS, e Symphony tem uma extensão que redimensiona imagens e armazena o resultado em cache, provendo a imagem redimensionada ao frontend. A extensão é chamada [JIT Image Manipulation](http://symphonyextensions.com/extensions/jit_image_manipulation/). Você pode ler mais sobre isto em [JIT Image Manipulation Concepts](http://www.getsymphony.com/learn/concepts/view/jit-image-manipulation/).

Para instalar, `git submodule add https://github.com/symphonycms/jit_image_manipulation.git extensions/jit_image_manipulation --recursive` e instale a extensão na página administrativa.

No arquivo news, mude a linha:

```<img src="{//data/params/workspace}{image/@path}/{image/filename}" width="500" alt=""/>```

para:

```<img src="{//data/params/root}/image/1/500/0{image/@path}/{image/filename}" alt=""/>```

---

O arquivo `/workspace/pages/news.xsl` parecerá com isto:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/format-date.xsl"/>
<xsl:import href="../utilities/ninja.xsl"/>

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:template match="/">
  <h1><xsl:value-of select="data/current-news/entry/title"/></h1>
  <p>
    <xsl:call-template name="format-date">
      <xsl:with-param name="date" select="data/current-news/entry/date"/>
      <xsl:with-param name="format" select="'%d;%ds; %m+;, %y+;'"/>
    </xsl:call-template>
  </p>
  <p><xsl:value-of select="data/current-news/entry/author/item"/></p>

  <xsl:apply-templates select="data/current-news/entry/text/*" mode="html"/>

  <ul>
    <xsl:for-each select="data/news-images/entry">
      <li>
        <img src="{//data/params/root}/image/1/500/0{image/@path}/{image/filename}" alt=""/>
        <br/>
        <xsl:value-of select="caption"/>
        <br/>
        <xsl:value-of select="credits"/>
        <hr/>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

</xsl:stylesheet>
```

#### O resultado aperfeiçoado:

![news-improved-result](screenshots/29-news-improved-result.png)


06. Conjunto Mywebsite
-----

A última extensão que instalaremos neste tutorial é [Export Ensemble](http://symphonyextensions.com/extensions/export_ensemble/). Esta extensão cria uma versão instalável do Symphony website.

Eu instalei esta extensão e exportei os arquivos de instalação para o projeto __Mywebsite__. Verifique aqui <https://github.com/bernardodiasc/symphony-tutorial/mywebsite>.


Para instalar, apenas coloque os arquivos na pasta pública do seu servidor Apache e abra a URL no navegador e você verá o Assitente de Instalação. Após isso, é só seguir os conceitos deste tutorial.

Espero que tenha gostado.

Saudações.


07. Agora é sua vez!
-----

Neste tutorial você aprendeu a criar um site muito simples, pegue o conjunto __mywebsite__ e construa algo melhor.

Você é bem-vindo ao fazer um fork e abrir uma PR para incluir suas próprias ideias :)


---


About Symphony CMS
-----

__[getsymphony.com](http://www.getsymphony.com/)__

> Características de equilíbrio perfeito do Symphony: o poder de fazer tudo o que você precisa, a inteligência de fazer apenas o que você precisa.

![getsymphony.com](screenshots/01-getsymphony.com.png)

Criado por Allen Chang e Alistair Kearney por mais de uma década, Symphony é um CMS Open Source XSLT-based feito em PHP e MySQL. Um CMS que te dá todo o controle do frontend do projeto.

