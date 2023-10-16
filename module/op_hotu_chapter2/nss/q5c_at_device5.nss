// Cast Knock at the door

void main()
{
   object oDoor = GetNearestObjectByTag("q5c_locked_door");
   if(!GetIsOpen(oDoor))
   {
        effect eVis = EffectVisualEffect(VFX_IMP_KNOCK);
        SetLocked(oDoor, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oDoor);
        DelayCommand(0.5, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
   }
}
