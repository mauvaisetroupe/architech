for img in *.jpg *.jpeg *.png; do
  width=$(sips -g pixelWidth "$img" | awk '/pixelWidth/ {print $2}')
  
  if [ "$width" -gt 2560 ]; then
    echo "Redimensionnement de $img ($width px de large)"
    sips -Z 2560 "$img"
  else
    echo "Skip $img (déjà $width px ou moins)"
  fi
done

