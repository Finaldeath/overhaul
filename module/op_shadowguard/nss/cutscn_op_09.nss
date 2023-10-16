#include "help_general"

void main()
{
    float f = 10.0;

    object oPC = GetPCSpeaker();

//    SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);

//    SetCameraFacing(GetFacing(oPC), f);

    object o;

    int i;

    for (i = 1; i <= 4; i++)
    {
        o = GetNearestObjectByTag("CT_COMM_SH_CITI_" + IntToString(i));

        DoAnimationPermanent(o, ANIMATION_LOOPING_WORSHIP, FALSE);
    }
}
