void main()
{
            object oDoor = GetNearestObjectByTag("M1Q5C04BlockedDoor");
            object oDrawl = GetLocalObject(GetModule(),"NW_G_M1Q5C04Drawl");
            ClearAllActions();
            ActionMoveToObject(GetNearestObjectByTag("WP_M1Q5C_Drawl"),TRUE);
            ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_SUNSTRIKE),OBJECT_SELF));
            ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_SUNSTRIKE),oDrawl));
            ActionDoCommand(DestroyObject(GetNearestObjectByTag("M1Q5C4Portal")));
            ActionDoCommand(DestroyObject(GetNearestObjectByTag("M1Q5C4Info")));
            ActionDoCommand(AssignCommand(oDrawl,SetIsDestroyable(TRUE)));
            ActionDoCommand(DestroyObject(oDrawl,2.0));
            ActionDoCommand(AssignCommand(oDoor,ActionOpenDoor(oDoor)));
            ActionDoCommand(DestroyObject(OBJECT_SELF,2.0));
            AddJournalQuestEntry("M1Q5_Begg_2b",70,GetLocalObject(OBJECT_SELF,"NW_L_M1Q5A06FollowTarget"));
}
