//::///////////////////////////////////////////////
//:: Name act_q6man_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Use lay on Hands on Walther
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oMan = GetObjectByTag("dyingman");
    SetCommandable(TRUE, oMan);
    SetLocalInt(oMan, "nCured", 1);
    SetLocalInt(oMan, "nLayOnHands", 1);
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, ActionPauseConversation());
    ActionPauseConversation();
    SetLocalInt(oMan, "nTalking", 1);

    AssignCommand(oPC,ActionMoveToObject(oMan));
    DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0, 1.0)));

    effect eEffect = GetFirstEffect(oMan);
    DelayCommand(5.0, RemoveEffect(oMan, eEffect));


    talent tTalent = TalentFeat(FEAT_LAY_ON_HANDS);
    //object oMe = oBlake;

    AssignCommand(oPC, ActionUseTalentOnObject(tTalent, oMan));

    DelayCommand(6.0, ActionResumeConversation());
    //DelayCommand(3.5, ActionStartConversation(oPC));
    //AssignCommand(GetPCSpeaker(), ActionResumeConversation());
    DelayCommand(6.0, SetLocalInt(oMan, "nTalking", 0));

}


