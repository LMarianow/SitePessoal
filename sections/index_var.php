<!DOCTYPE html>
<!-- HOSTED ON SITEGROUND -->
<html lang="pt-br">
    <head>
        <title>Lucas Mariano - Developer, Tech Entusiasta</title>
        <link rel="shortcut icon" href="images/v6/icons/favicon.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="Author" content="Lucas Mariano" />

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- build:template:dist
        @@cssMinFile
        /build -->
        <!-- build:remove:dist -->
        <link rel="stylesheet" href="css/common.css" />
        <link rel="stylesheet" href="css/csselements.css" />
        <link rel="stylesheet" href="css/csselements_small.css" />
        <link rel="stylesheet" href="css/csselements_print.css" />
        <link rel="stylesheet" href="css/csselements_resume.css" />

        <link rel="stylesheet" href="scripts/vendor/fancybox-3.0/dist/jquery.fancybox.min.css" />
        <!-- /build -->


    </head>

    <body>
        <div class="parent">
            <div class="nav">
<!-- HEADER -->
                <?php include 'sections/header.php'; ?>
            </div>

            <div class="content">
<!-- ABOUT SECTION -->
                <?php include 'sections/about.php'; ?>

<!-- RESUME SECTION -->
                <?php include 'sections/resume.php'; ?>

<!-- BUILDS SECTION -->
                <?php include 'sections/builds.php'; ?>

<!-- PROJECTS SECTION -->
                <?php include 'sections/projects.php'; ?>

<!-- CONTACT SECTION -->
                <?php include 'sections/contact.php'; ?>

                <div class="footer-content">
<!-- FOOTER -->
                    <?php include 'sections/footer.php'; ?>
                </div>

<!-- PROMPT -->
                <!-- HEY!  What are you doing here?  This is a top secret command prompt
                that no one knows about!  Well, if you're reading this, I guess you know
                what you're doing.  Or you're really lost.  If you press the tilde ~ key
                on the non-mobile version of this website, a command prompt will appear! -->
                <?php include 'sections/prompt.php'; ?>
            </div>
        </div>

        <!-- build:template:dist
        @@jsMinFile
        /build -->
        <!-- build:remove:dist -->
        <script type="text/javascript" src="scripts/vendor/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="scripts/vendor/fancybox-3.0/dist/jquery.fancybox.min.js"></script>

        <script type="text/javascript" src="scripts/js/header.js"></script>
        <script type="text/javascript" src="scripts/js/jselements.js"></script>
        <script type="text/javascript" src="scripts/js/prompt.js"></script>
        <script type="text/javascript" src="scripts/js/contact.js"></script>
        <!-- /build -->


    </body>
</html>
