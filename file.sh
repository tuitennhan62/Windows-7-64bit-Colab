wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Please wait for installing...
echo "Installing QEMU (2-3m)..."
sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1
echo Downloading Windows Disk...
curl -L -o lite7.qcow2 https://objects.githubusercontent.com/github-production-release-asset-2e65be/456919124/12a9bcbb-18d6-4e1a-9277-137225c6923f?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220209%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220209T074454Z&X-Amz-Expires=300&X-Amz-Signature=1aabaa29e93d8245f11c1c578c91ff01a9b6cbe0c01bf4e330fd06937c55ded4&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=456919124&response-content-disposition=attachment%3B%20filename%3DTINY.7.qcow2&response-content-type=application%2Foctet-stream
echo "Windows 7 x86 Lite On Google Colab"
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Note: Use Right-Click Or Ctrl+C To Copy"
echo "Please Keep Colab Tab Open, Maximum Time 12h"
echo "Press F12, choose tab Console and paste these line then press Enter"
echo ================================
echo "function ClickConnect() {
  console.log('Working')
  document
    .querySelector('#top-toolbar > colab-connect-button')
    .shadowRoot.querySelector('#connect')
    .click()
} 
setInterval(ClickConnect, 60000)"
echo ================================
echo Script by HanO
echo Cell: +84978.39.41.43
echo Email: daibangcam@gmail.com
echo Website: hano.cf
echo ================================
sudo qemu-system-x86_64 -vnc :0 -hda lite7.qcow2  -smp cores=2  -m 8192M -machine usb=on -device usb-tablet > /dev/null 2>&1