//::///////////////////////////////////////////////
//:: OnUse: Toggle Activate
//:: q2d_use_control
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Simple script to toggle the placeable animation
    state for placeables that support Activate and
    DeActivate Animations

    Placeables are best set to be DeActivated by
    default with this script.

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-09-10
//:://////////////////////////////////////////////
//UPDATE Oct 22 - keith Warner - Illithid Controls play a speak string as well
void main()
{
    // * note that nActive == 1 does  not necessarily mean the placeable is active
    // * that depends on the initial state of the object
    int nActive = GetLocalInt (OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE");
    // * Play Appropriate Animation
    if (!nActive)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        object oPC = GetLastUsedBy();
        int nRandom = Random(3) + 1;
        int nStrRef = 100945;
        switch (nRandom)
        {
            case 1: nStrRef = 100945;
                    break;
            case 2: nStrRef = 100946;
                    break;
            case 3: nStrRef = 100946;
                    break;
        }
        FloatingTextStrRefOnCreature(nStrRef, oPC, FALSE);
    }
    else
    {
      ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
    // * Store New State
    SetLocalInt(OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE",!nActive);
}
