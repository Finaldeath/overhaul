//::///////////////////////////////////////////////
//:: Conversation
//:: m2casthealing
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cast a healing spell on the NPC.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 18, 2002
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    AssignCommand(GetPCSpeaker(), ActionPauseConversation());
    object oPC = GetPCSpeaker();
    talent tTalent = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_HEALING_TOUCH, 20, oPC);
    if (GetIsTalentValid(tTalent) == TRUE)
    {
      object oMe = OBJECT_SELF;
      AssignCommand(oPC, ActionUseTalentOnObject(tTalent, oMe));
    }
    ActionResumeConversation();
    AssignCommand(GetPCSpeaker(), ActionResumeConversation());
}
