// * If Hit points are less than 50 ( THIS IS TRICKY!  It may require lots of work
//or a MINHP1 ring
// * Maugrim is dead
// * raise  him if undead area available
// * This script will also be on the undead
// * NW_L_POSSESS  = 1 if the undead has been possessed by Maugrim


void main()
{        // SpeakString("more than 50");
    if (GetCurrentHitPoints(OBJECT_SELF) < 50)
    {
       // SpeakString("less than 50 " + GetTag(OBJECT_SELF));
        if ((GetStringLowerCase(GetTag(OBJECT_SELF)) == GetStringLowerCase("m4q01b26maug"))
            || (GetLocalInt(OBJECT_SELF,"NW_L_POSSESS") == 1))
        {
          // SpeakString("Tag worked");
            SetPlotFlag(OBJECT_SELF, TRUE);
            object oFlesh = GetNearestObjectByTag("M4Q1B26Servant");
            if (GetIsObjectValid(oFlesh) == TRUE && GetIsDead(oFlesh) == FALSE)
            {
                // * reanimate a body
                //SpeakString("here");


                effect eVis = EffectVisualEffect(VFX_IMP_DEATH_WARD);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oFlesh);
                eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
               // SpeakString("Found a body");
                SetLocalInt(GetModule(),"NW_G_M4Q01PLOTMAUGRIM",1);
                // * make golem unkillable, so that they can speak

                SpeakOneLinerConversation();
                SetLocalInt(GetModule(),"NW_G_M4Q01PLOTMAUGRIM",0);
                SetLocalInt(oFlesh,"NW_L_POSSESS",1);
                SetPlotFlag(OBJECT_SELF, FALSE);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), OBJECT_SELF);

                //* Can't get makign the monster speak to work!
                AssignCommand(oFlesh, SpeakOneLinerConversation());
            }
            else
            {
                SetLocked(GetNearestObjectByTag("M4Q1B26"), FALSE);

                effect eVis = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
                // * Truly Dead
              //  SpeakString("Final Death");
                SetLocalInt(GetModule(),"NW_G_M4Q01PLOTMAUGRIM",99);
                SpeakOneLinerConversation();
                SetPlotFlag(OBJECT_SELF, FALSE);
                DelayCommand(0.2,ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), OBJECT_SELF));
                SetCommandable(FALSE);
                // * spawn in chest with word of power
//                object oChest = CreateObject(OBJECT_TYPE_PLACEABLE,"PLC_CHEST003",GetLocation(GetNearestObjectByTag("M4Q1B26_Chest")));
//                ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_DEATH_WARD),GetLocation(GetNearestObjectByTag("M4Q1B26_Chest")));
            }
        }
     }
}
