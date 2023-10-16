//::///////////////////////////////////////////////
//:: OnUse: Toggle Activate
//:: q2d4_use_illmech
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Simple script to toggle the placeable animation
    state for placeables that support Activate and
    DeActivate Animations

    Placeables are best set to be DeActivated by
    default with this script.

    Illithid Amplifier controller mechanisms.
    If both are activated - then shutdown the amplifier

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 22/03
//:://////////////////////////////////////////////
void main()
{
    // * note that nActive == 1 does  not necessarily mean the placeable is active
    // * that depends on the initial state of the object
    int nActive = GetLocalInt (OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE");
    // * Play Appropriate Animation
    if (!nActive)
    {
      ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
      SetLocalInt(OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE",1);
      PlaySound("sce_positive");
      object oSound = GetObjectByTag("snd_q2d4_illmech");
      SoundObjectPlay(oSound);
    }
    else
    {
      ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
      SetLocalInt(OBJECT_SELF,"X2_L_PLC_ACTIVATED_STATE",0);
      PlaySound("sce_negative");
      object oSound = GetObjectByTag("snd_q2d4_illmech");
      SoundObjectStop(oSound);
    }

    SpeakOneLinerConversation("q2d4_illmech");



    //if both mechanisms are activated - you can destroy the Amplifier - freeing the slaves
    object oAmplifier = GetObjectByTag("q2damplifier");

    object oMechanism1 = GetObjectByTag("q2d4_ampmech_1");
    object oMechanism2 = GetObjectByTag("q2d4_ampmech_2");

    if (GetLocalInt (oMechanism1,"X2_L_PLC_ACTIVATED_STATE") == 1 &&GetLocalInt (oMechanism2,"X2_L_PLC_ACTIVATED_STATE") == 1)
    {
        SetPlotFlag(oAmplifier, FALSE);
        SetLocalInt(oAmplifier, "nAmpUseable", 1);

    }
    else
    {
        SetPlotFlag(oAmplifier, TRUE);
        SetLocalInt(oAmplifier, "nAmpUseable", 0);
    }


}
