Design
====================

Save yourself a lot of rework by getting at least a rough idea of what you want to build, before you build it!

## User Experience
The frontend design process is split between UX (User Experience, the overall flow) and UI (the User Interface, the actual look and feel).  An example of a User Experience might be "A user can access any feature on the site in 4 clicks or less".

### Tools
Here is a list of useful tools for quickly mocking up a potential user experience

* [lucidchart.com](https://lucidchart.com) - great for diagrams
* [mockplus](https://www.mockplus.com/)
* [balsamiq](https://balsamiq.com/) - wireframes

## User Interface
You save a **lot** of rework when building frontend apps if you can clearly specify what the app should look like before you build it.  One way to build apps quickly is to follow consistent style [frameworks](##frameworks).  If you're looking to build something more bespoke, then it really makes sense to leverage a design tool.

SAS provide some great guidance for building visually appealing interfaces - see: [https://communities.sas.com/html/assets/breports/index.html](https://communities.sas.com/html/assets/breports/index.html). More from the SAS design team here: [https://medium.com/sas-software-design](https://medium.com/sas-software-design).

### Tools

#### Figma
Figma is a web based tool (although there are desktop versions) which means you can access your work from any machine.  It comes highly recommended from us for a number of reasons:

* Free to use
* Send links to your designs
* A developer can extract each object (eg as vectors), and exact CSS attributes
* Design screens that respond to screen size changes

It's a professional tool, and well worth spending an hour or so to learn about.

Link:  [https://www.figma.com](https://www.figma.com)

#### Sketch
[Sketch](https://www.sketch.com/) - a great desktop tool, used primarily on macs.  Very powerful for drawing images and standalone graphics.

## Tips

### HTML Character Codes

You can spice (&#127798;) up your page(📃) with a special character codes (&#127752;) to make it more fun and readable!  You can do this by entering the UTF-8 characters directly in your code - however this can occasionally cause problems when copy pasting into different editors (eg WLATIN1, or SAS Enterprise Guide in some windows instances).

An alternative is to use HTML escape codes.  So for instance, use `&#128424;` to represent &#128424;.

A useful website for finding / searching for such codes is here: [https://html-css-js.com/html/character-codes/icons/](https://html-css-js.com/html/character-codes/icons/).

### Icons
An alternative to special characters is to use dedicated icon sets.  This provides a broader range of images, without necessarily involving the load of an image (they are often embedded within CSS in Base64 or SVG format, or contain large numbers of images in a single PNG)

The great thing is that they can be easily added to your page with a simple tag.

Examples of icon sets:

* Streamline: https://streamlineicons.com
* Clarity:  https://clarity.design/icons
* Linea:  https://linea.io/

## Frameworks
It's possible to build good looking apps quickly without having to specify every detail if you can follow existing style guides / frameworks.  Choices include:

* [Semantic ui](https://semantic-ui.com/) - with a specific [version](https://react.semantic-ui.com/) for React
* [Clarity Design](https://clarity.design) - Angular but will soon support React / Vue also
* [Material Design](https://material.io/design/) - built by Google
* [Fluent UI](https://developer.microsoft.com/en-us/fluentui#/controls/web) - built by Microsoft

## Image Editing

* [https://svgtopng.com](https://svgtopng.com/)
* [https://www.photopea.com](https://www.photopea.com) - adobe like
* [https://onlinepngtools.com/convert-png-to-jpg](https://onlinepngtools.com/convert-png-to-jpg) - for adding background in png
* [https://www.calculatorsoup.com/calculators/math/ratios.php](https://www.calculatorsoup.com/calculators/math/ratios.php) - maintaining ratio stuff


<meta name="description" content="Build great looking SAS Web apps by following design principles and using industry frameworks">
