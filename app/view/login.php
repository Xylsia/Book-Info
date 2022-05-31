<?php include 'layout/header.php'; ?>

<div class="wrapper-calc">
    <div class="form-wrap">
        <form class="form" method="POST" action="../controller/AuthController.php?login">
            <label class="label"> Username </label>
            <input type="text" class="input" name="username" placeholder="Enter username" />
            <span id="username-span"></span>

            <label class="label"> Password </label>
            <input type="password" class="input" name="password" placeholder="Enter password" />
            <span id="password-span"></span>

            <button type="submit" class="input btn" name="loginBtn" > Login </button>
        </form>
    </div>
</div>

<?php include 'layout/footer.php'; ?>