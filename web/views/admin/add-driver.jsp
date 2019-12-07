<div style="padding:2.5em;">
    
    <h2>Add Drivers</h2>

    <form class="mdc-form-field" action="<%=request.getContextPath()%>/createdriver" method="post">

        <div class="mdc-text-field mdc-text-field--outlined">
            <input class="mdc-text-field__input" name="fullname">
            <div class="mdc-notched-outline">
                <div class="mdc-notched-outline__leading"></div>
                <div class="mdc-notched-outline__notch">
                    <label for="text-field-hero-input" class="mdc-floating-label">Full Name</label>
                </div>
                <div class="mdc-notched-outline__trailing"></div>
            </div>
        </div>

        <div class="mdc-text-field mdc-text-field--outlined">
            <input class="mdc-text-field__input" name="email">
            <div class="mdc-notched-outline">
                <div class="mdc-notched-outline__leading"></div>
                <div class="mdc-notched-outline__notch">
                    <label for="text-field-hero-input" class="mdc-floating-label">Email</label>
                </div>
                <div class="mdc-notched-outline__trailing"></div>
            </div>
        </div>

        <div class="mdc-text-field mdc-text-field--outlined">
            <input class="mdc-text-field__input" name="username">
            <div class="mdc-notched-outline">
                <div class="mdc-notched-outline__leading"></div>
                <div class="mdc-notched-outline__notch">
                    <label for="text-field-hero-input" class="mdc-floating-label">User Name</label>
                </div>
                <div class="mdc-notched-outline__trailing"></div>
            </div>
        </div>

        <div class="mdc-text-field mdc-text-field--outlined">
            <input class="mdc-text-field__input" name="plateNumber">
            <div class="mdc-notched-outline">
                <div class="mdc-notched-outline__leading"></div>
                <div class="mdc-notched-outline__notch">
                    <label for="text-field-hero-input" class="mdc-floating-label">License Plate Number</label>
                </div>
                <div class="mdc-notched-outline__trailing"></div>
            </div>
        </div>

        <div class="mdc-text-field mdc-text-field--outlined">
            <input class="mdc-text-field__input" name="password">
            <div class="mdc-notched-outline">
                <div class="mdc-notched-outline__leading"></div>
                <div class="mdc-notched-outline__notch">
                    <label for="text-field-hero-input" class="mdc-floating-label">Password</label>
                </div>
                <div class="mdc-notched-outline__trailing"></div>
            </div>
        </div>

        <div class="button-container">
            <button type="submit" class="mdc-button mdc-button--raised">
                <!--  <i class="material-icons mdc-button__icon" aria-hidden="true">home</i> -->
                <span class="mdc-button__label">Create</span>
            </button>

            <button type="submit" class="mdc-button mdc-button--raised">
                <!--  <i class="material-icons mdc-button__icon" aria-hidden="true">home</i> -->
                <span class="mdc-button__label">Cancel</span>
            </button>
        </div>

    </form>

</div>

