//::///////////////////////////////////////////////
//:: Name act_q1hblake_4
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
    object oBlake = GetObjectByTag("q1hblake");
    SetLocalInt(oBlake, "nCured", 1);
    SetLocalInt(oBlake, "nLayOnHands", 1);
    object oPC = GetPCSpeaker();

    SetLocalInt(oBlake, "nTalking", 1);

    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0, 1.0));

    effect eEffect = GetFirstEffect(oBlake);
    DelayCommand(2.0, RemoveEffect(oBlake, eEffect));
    AssignCommand(oPC, ActionPauseConversation());

    talent tTalent = TalentFeat(FEAT_LAY_ON_HANDS);
    //object oMe = oBlake;
    AssignCommand(oPC,ActionMoveToObject(oBlake));
    AssignCommand(oPC, ActionUseTalentOnObject(tTalent, oBlake));

    DelayCommand(6.0, ActionResumeConversation());
    DelayCommand(3.5, ActionStartConversation(oPC));
    //AssignCommand(GetPCSpeaker(), ActionResumeConversation());
    DelayCommand(6.0, SetLocalInt(oBlake, "nTalking", 0));

}


