# safey
Sistema en linux para ingresar un password y abrir puertas


echo "[Unit] 
Description=Safey

[Service] 
ExecStart=/home/modularbox/Escritorio/app.sh 
Restart=always 
RestartSec=3
StandardOutput=journal 
StandardError=journal 
SyslogIdentifier=safey

[Install] 
WantedBy=multi-user.target " > /etc/systemd/system/app.service