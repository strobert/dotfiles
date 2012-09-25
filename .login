if ($?SSH_TTY) then
   date >> /tmp/login.debug
   set shorthost=`echo $HOST | perl -p -e 's/\..*$//;'`
   if ($?shorthost && -d ~/.auth_sock.d) then
      set ssh_sock_path=~/.auth_sock.d/$shorthost
   else
      set ssh_sock_path=~/.auth_sock
   endif
   echo "$ssh_sock_path" >> /tmp/login.debug
   if ($?SSH_AUTH_SOCK) then
      echo "have SSH_AUTH_SOCK: ${SSH_AUTH_SOCK}" >> /tmp/login.debug
   else
      echo "no SSH_AUTH_SOCK" >> /tmp/login.debug
   endif
   if ($?SSH_AUTH_SOCK) then
      if ($SSH_AUTH_SOCK != ${ssh_sock_path}) then
         echo "$SSH_AUTH_SOCK" >> /tmp/login.debug
         set my_set_ssh_auth = $SSH_AUTH_SOCK
         set my_prev_ssh_auth = `readlink -n ${ssh_sock_path}`
         ln -sf "$SSH_AUTH_SOCK" "${ssh_sock_path}"
         setenv SSH_AUTH_SOCK $ssh_sock_path
      endif
   endif
endif
