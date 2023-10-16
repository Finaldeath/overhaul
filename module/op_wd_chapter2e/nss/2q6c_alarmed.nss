//::///////////////////////////////////////////////
//:: Speak String
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the wizard say something.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oMage = GetNearestObjectByTag("2Q6_UnderWizard");
    if(GetIsObjectValid(oMage))
    {
        AssignCommand(oMage, SpeakOneLinerConversation("2q6c_bad_summon"));
    }
}
