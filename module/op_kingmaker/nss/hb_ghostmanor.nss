//::///////////////////////////////////////////////
//:: hb_ghostmanor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This handles the random ghostly activities in
    Thanlor manor while its still haunted.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    // random ghostly stuff
    int iRand = Random(6);
    location lPoint1, lPoint2;
    effect eVFXBld, eGhost, eVFX;
    object oGhost, oDoor1, oDoor2;

    if (GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD") < 30)
    {
        switch (iRand)
        {
            //Slam doors wildly :)
            case (0):
                oDoor1 = GetObjectByTag("km_ghostdoor", Random(3));
                oDoor2 = GetObjectByTag("km_ghostdoor", Random(3));
                AssignCommand(oDoor1, ClearAllActions());

                if(GetIsOpen(oDoor1)==FALSE)
                {
                    AssignCommand( oDoor1, ActionOpenDoor(OBJECT_SELF));
                    AssignCommand( oDoor2, ActionOpenDoor(OBJECT_SELF));
                }
                else
                {
                    AssignCommand( oDoor1, ActionCloseDoor(OBJECT_SELF));
                    AssignCommand( oDoor2, ActionCloseDoor(OBJECT_SELF));
                }
            break;

            //Lady Rehan takes a stroll
            case (1) :
                eGhost = EffectCutsceneGhost();
                eVFX = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);

                lPoint1 = GetLocation(GetObjectByTag("KM_GHOSTWAY", Random(8)));
                lPoint2 = GetLocation(GetObjectByTag("KM_GHOSTWAY", Random(8)));
                oGhost = CreateObject(OBJECT_TYPE_CREATURE, "km_rehanghost", lPoint1);

                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oGhost);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oGhost);
                AssignCommand(oGhost, ActionForceMoveToLocation(lPoint2));

                // have her play a spasm animation if she doesn't walk anywhere
                if (lPoint1 == lPoint2)
                {
                    DelayCommand(1.0,
                        AssignCommand(oGhost,
                            ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 3.0, 10.0f)));
                }

                // Make her cry as she walks
                if (Random(2))
                {
                    DelayCommand(1.6, AssignCommand(oGhost,
                        PlaySound("as_pl_wailingf6")));
                }
                else
                {
                    DelayCommand(1.6, AssignCommand(oGhost,
                        PlaySound("as_pl_cryingf2")));
                }

                DelayCommand(2.6 + Random(4), DestroyObject(oGhost));
            break;

            // Darkness walks the halls
            case (2) :
                eVFXBld = EffectVisualEffect(VFX_DUR_ANTI_LIGHT_10);
                lPoint1 = GetLocation(GetObjectByTag("km_ghostblood", Random(8)));
                ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVFXBld, lPoint1, 0.6 + Random(3));

            break;
        }
    }
}
