void main()
{
   ActionPauseConversation();
   ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK);
   ActionResumeConversation();
   AssignCommand(GetPCSpeaker(),ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));
}
