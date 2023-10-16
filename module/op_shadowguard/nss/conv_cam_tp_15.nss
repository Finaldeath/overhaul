#include "help_hench"

void main()
{
    float f = 15.0;

    object oPC = GetPCSpeaker();

    ChangeCameraFacing(oPC, CAMERA_MODE_TOP_DOWN, f);
}
