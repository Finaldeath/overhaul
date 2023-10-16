#include "help_general"

void main()
{
    float f = 10.0;

    object oPC = GetPCSpeaker();

//    SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);

//    SetCameraFacing(GetFacing(oPC), f);

    object o;

    o = GetNearestObjectByTag("NW_OLDMAN_2");

    DoAnimationPermanent(o, ANIMATION_LOOPING_GET_LOW);

    o = GetNearestObjectByTag("NW_OLDWOMAN_2");

    DoAnimationPermanent(o, ANIMATION_LOOPING_DEAD_FRONT);
}
