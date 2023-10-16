//::///////////////////////////////////////////////
//:: Witch's Wake 1: Gong (Helga Variant)
//:: WW1_Gong_Helga
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Ringing the gong in the guildhall provokes a
     response from Helga.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 27, 2004
//:://////////////////////////////////////////////

void main()
{
    PlaySound("as_cv_gongring2");
    object oVoice = GetNearestObjectByTag("ww1_narrator193");
    SoundObjectPlay(oVoice);
    DelayCommand(25.0, SoundObjectStop(oVoice));

    object oHelga = GetNearestObjectByTag("Helga");
    string sMsg = "There be no need for you to be ringing that, now, understand me?";
    AssignCommand(oHelga, SpeakString(sMsg));
}
