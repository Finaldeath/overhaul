//* Used to heal Uthgardt Warriors
void main()
{
    ActionPauseConversation();
    AssignCommand(GetPCSpeaker(), ActionPauseConversation());
    object oPC = GetPCSpeaker();
    talent tTalent = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_HEALING_TOUCH, 20, oPC);
    if (GetIsTalentValid(tTalent) == TRUE)
    {
      object oMe = OBJECT_SELF;
      AssignCommand(oPC,ActionMoveToObject(oMe));
      AssignCommand(oPC, ActionUseTalentOnObject(tTalent, oMe));
    }
    ActionResumeConversation();
    AssignCommand(GetPCSpeaker(), ActionResumeConversation());
}
