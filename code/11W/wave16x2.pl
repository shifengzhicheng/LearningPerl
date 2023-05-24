use Win32::Sound;
$WAV = new Win32::Sound::WaveOut(44100, 16, 2);

$data = ""; 
$counter = 0;
$increment = 5280/44100;

# Generate 44100 samples ( = 1 second)
for $i (1..44100) {
# Calculate the pitch 
# (range 0..255 for 8 bits per channel)
# (range -16384 to +16383 for 16 bits perl channel)
$l = int(sin($counter/2*3.1416) * 1000);
$r = int(sin($counter/3*3.1416) * 1000);
# "pack" it twice for left and right
$data .= pack("v", $l) . pack("v", $r);
$counter += $increment;
}

$WAV->Load($data);       # get it
$WAV->Write();           # hear it
1 until $WAV->Status();  # wait for completion
$WAV->Save("sinus.wav"); # write to disk
$WAV->Unload();          # drop it
