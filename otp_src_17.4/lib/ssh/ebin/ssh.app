%%% This is an -*- erlang -*- file.

{application, ssh,
 [{description, "SSH-2 for Erlang/OTP"},
  {vsn, "3.1"},
  {modules, [ssh,
	     ssh_app,
	     ssh_acceptor,
	     ssh_acceptor_sup,
	     ssh_auth,
	     ssh_message,
	     ssh_bits,
	     ssh_cli,
             ssh_client_key_api,
	     ssh_channel,
	     ssh_channel_sup,
	     ssh_connection,
	     ssh_connection_handler,
	     ssh_connection_sup,
	     ssh_daemon_channel,
	     ssh_shell,
	     sshc_sup,
	     sshd_sup,
	     ssh_file,
	     ssh_io,
	     ssh_info,
	     ssh_math,
	     ssh_no_io,
             ssh_server_key_api,
	     ssh_sftp,
	     ssh_sftpd,
	     ssh_sftpd_file,
	     ssh_sftpd_file_api,
	     ssh_subsystem_sup,
	     ssh_sup,
	     ssh_system_sup,
	     ssh_transport,
	     ssh_xfer]},
  {registered, []},
  {applications, [kernel, stdlib, crypto, public_key]},
  {env, []},
  {mod, {ssh_app, []}},
  {runtime_dependencies, ["stdlib-2.3","public_key-0.22","kernel-3.0",
			  "erts-6.0","crypto-3.3"]}]}.

