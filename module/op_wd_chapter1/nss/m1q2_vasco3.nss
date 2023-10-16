//::///////////////////////////////////////////////
//:: Vasco's Secret Bloodsailor Handshake
//:: m1q2_Vasco3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script causes the Bloodsailor to perform
    the secret handshake for Vasco.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2001
//:://////////////////////////////////////////////

void main()
{
    ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING,1.0,1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW);
    ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,1.0,1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE);
}
