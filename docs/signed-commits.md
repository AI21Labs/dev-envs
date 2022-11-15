# Signing Your Work [Optional]

If you like people to know that your commits come from a trusted source, then you can verify and sign your commits - [More Info](https://confluence.atlassian.com/bitbucketserver/using-gpg-keys-913477014.html).

1. Let's generate a GPG key, add it to your GitHub account, associate it with your email and then make sure your commits are signed.
   - [Generate a new GPG key](https://confluence.atlassian.com/bitbucketserver/using-gpg-keys-913477014.html#UsingGPGkeys-GenerateanewGPGkey)
   - [Add a new GPG key to your GitHub account](https://confluence.atlassian.com/bitbucketserver/using-gpg-keys-913477014.html#UsingGPGkeys-AddaGPGkey)
   - [Associate an email with your GPG key](https://confluence.atlassian.com/bitbucketserver/using-gpg-keys-913477014.html#UsingGPGkeys-configure)
   - [Sign your commits](https://confluence.atlassian.com/bitbucketserver/using-gpg-keys-913477014.html#UsingGPGkeys-SigncommitsandtagswithaGPGkey).
     Make sure to update *git config* as described in the **Tips** section and that your local configuration contains the following (your signing key output will be different):

   ```shell
   $ git config --global user.signingKey
   EE5BCADCCC9E4FC4
   $ git config --global commit.gpgsign
   true
   ```

2. Let's test locally by issuing an [empty commit](https://git-scm.com/docs/git-commit#Documentation/git-commit.txt---allow-empty) to verify your commits are signed.

   ```shell
   mkdir signing-test && cd $_
   git init -q
   git commit --allow-empty -s -m 'signing test'
   git show --show-signature
   cd - && rm -rf signing-test # clean-up
   ```

   Expected output:

   ```shell
   commit 37d74bb57782d9e31813690845d26cbc5245d09f (HEAD -> master)
   gpg: Signature made Mon Apr 12 12:20:07 2021 IDT
   gpg:                using RSA key 04F17CBDBD2D6FC56FD186F2B441CE92D438A2C5
   gpg: Good signature from "x <382787@users.noreply.github.com>" [ultimate]
   Author: x <382787@users.noreply.github.com>
   Date:   Mon Apr 12 12:20:07 2021 +0300

       signing test

       Signed-off-by: x <382787@users.noreply.github.com>
   ```

3. Let's test by commiting to remote branch from one of your repositories:

   ```shell
   git checkout -b test-signed-commits
   git commit -m 'test: signed commits' --allow-empty
   git push -u origin test-signed-commits
   ```
