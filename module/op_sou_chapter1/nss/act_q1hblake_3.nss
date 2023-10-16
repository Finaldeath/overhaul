//::///////////////////////////////////////////////
//:: Name act_q1hblake_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cast Best Cure Spell/Talent on Walther
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    object oWalther = GetObjectByTag("q1hblake");

    SetLocalInt(oWalther, "nTalking", 1);


    effect eEffect = GetFirstEffect(oWalther);
    DelayCommand(2.0, RemoveEffect(oWalther, eEffect));
    AssignCommand(oPC, ActionPauseConversation());

    talent tTalent = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_HEALING_TOUCH, 20, oPC);
    if (GetIsTalentValid(tTalent) == TRUE)
    {
      //object oMe = OBJECT_SELF;
      AssignCommand(oPC,ActionMoveToObject(oWalther));
      AssignCommand(oPC, ActionUseTalentOnObject(tTalent, oWalther));
    }
    DelayCommand(6.0, ActionResumeConversation());
    //AssignCommand(GetPCSpeaker(), ActionResumeConversation());
    DelayCommand(6.0, SetLocalInt(oWalther, "nTalking", 0));
    SetLocalInt(oWalther, "nCured", 1);
}
