void main()
{
   SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
   ActionMoveAwayFromObject(GetPCSpeaker(),TRUE);
   DelayCommand(5.0,DestroyObject(OBJECT_SELF));
}
