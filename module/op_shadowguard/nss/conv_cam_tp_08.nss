#include "help_hench"

void main()
{
    float f = 8.0;

    object oPC = GetPCSpeaker();

    ChangeCameraFacing(oPC, CAMERA_MODE_TOP_DOWN, f);
}
