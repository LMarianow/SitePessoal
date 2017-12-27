<div data-section-name="contact">
    <div class="section-header section-header-size">Contato</div>

    <div class="content-text">
        <div class="contact-methods">
            <div class="contact-social-block">
                <h2 class="first-header">Visite minhas redes sociais...</h2>

                <div class="contact-links">
                    <a href='https://www.facebook.com/LMarianoo' target='_blank' alt='Facebook' title='Facebook'>
                        <div class='contact-social'>
                            <?php echo file_get_contents("images/v6/social/facebook-logo-contact.svg"); ?>
                            <span class="contact-social-words">/LMarianoo</span>
                        </div>
                    </a>

                    <a href='https://www.linkedin.com/in/LMarianoo' target='_blank' alt='LinkedIn' title='LinkedIn'>
                        <div class='contact-social'>
                            <?php echo file_get_contents("images/v6/social/linkedin-logo-contact.svg"); ?>
                            <span class="contact-social-words">/LMariano</span>
                        </div>
                    </a>

                    <a href='https://github.com/LMarianow' target='_blank' alt='GitHub' title='GitHub'>
                        <div class='contact-social'>
                            <?php echo file_get_contents("images/v6/social/mark-github-contact.svg"); ?>
                            <span class="contact-social-words">/LMariano</span>
                        </div>
                    </a>
                </div>
            </div>

            <div class="contact-form-block">
                <h2 class="first-header">...ou me mande uma mensagem direta.</h2>

                <div class="contact-form">
                    <form action="scripts/php/email_form.php" id="contact-form" method="post" target="_top">
                        <?php
                        $textareaMsg = "";

                        if (!empty($_GET["message"])) {
                            $message = $_GET["message"];

                            if($message == "resume") {
                                $textareaMsg = "Eu gostaria da cópia de seu resumo.";
                                echo '<div class="alert alert-offset">';
                                echo "<img class='contact-link-image' src='images/icons/info.svg?v=2'><div class='contact-alert-text'> Para o requerimento da versão de meu resumo por favor entre com seu nome, email e qualquer informação adicional.</div>";
                                echo '</div>';
                            }
                            else if($message == "success") {
                                echo '<div class="success alert-offset">';
                                echo "<img class='contact-link-image' src='images/icons/check.svg'><div class='contact-alert-text'> Sua mensagem foi enviado com sucesso. Muito Obrigado!</div>";
                                echo '</div>';
                            }
                        }
                        ?>

                        <div id="validation-errors" class="errors alert-offset"></div>

                        <div class="inputs">
                            <div class="name-input">
                                <input id="name-input" class="inputbox-mod" type="text" placeholder="Nome" name="name">
                            </div>

                            <div class="email-input">
                                <input id="email1-input" class="inputbox-mod" type="email" placeholder="Email" name="fromemail">
                            </div>

                            <div class="email-confirm-input">
                                <input id="email2-input" class="inputbox-mod" type="email" placeholder="Confirme seu Email" name="confirmfromemail">
                            </div>

                            <div class="antispam antispam-input">
                                <input class="inputbox-mod" type="text" placeholder="Deixe este campo em branco!" name="spam">
                            </div>
                        </div>

                        <div class="comments comment-input">
                            <textarea class="textarea-mod" name="usercomments" placeholder="Mensagem" maxlength="5000"><?php echo $textareaMsg; ?></textarea>
                        </div>

                        <div class="buttons button-input">
                            <button class="submit-button" type="button" id="send-contact-form">Enviar</button>
                            <button class="submit-button reset-button" type="reset" id="reset-contact-form">Limpar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
