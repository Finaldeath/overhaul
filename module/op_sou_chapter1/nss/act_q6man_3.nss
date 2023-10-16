//::///////////////////////////////////////////////
//:: Name act_q6man_3
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

    object oMan = GetObjectByTag("dyingman");
    SetCommandable(TRUE, oMan);

    SetLocalInt(oMan, "nTalking", 1);


    effect eEffect = GetFirstEffect(oMan);
    DelayCommand(5.0, RemoveEffect(oMan, eEffect));
    AssignCommand(oPC, ActionPauseConversation());

    talent tTalent = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_HEALING_TOUCH, 20, oPC);
    if (GetIsTalentValid(tTalent) == TRUE)
    {
      //object oMe = OBJECT_SELF;
      AssignCommand(oPC,ActionMoveToObject(oMan));
      DelayCommand(0.5, AssignCommand(oPC, ActionUseTalentOnObject(tTalent, oMan)));
    }
    DelayCommand(6.0, ActionResumeConversation());
    //AssignCommand(GetPCSpeaker(), ActionResumeConversation());
    DelayCommand(6.0, SetLocalInt(oMan, "nTalking", 0));
    SetLocalInt(oMan, "nCured", 1);
}
