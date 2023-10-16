//::///////////////////////////////////////////////
//:: Crypt Tower, Level 3 (User-Defined)
//:: UD_Crypt_03.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launch the Wall Maze.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

void CreateFence(location lFence)
{
    effect eVFX = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_GREASE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lFence);
    CreateObject(OBJECT_TYPE_PLACEABLE, "fencemaze", lFence, TRUE);
    CreateObject(OBJECT_TYPE_PLACEABLE, "fencemaze_invis", lFence, TRUE);
}

void main()
{
    int bMazeOn = GetLocalInt(OBJECT_SELF, "bMazeOn");
    int iFenceCount = 94;
    int iMaxLoop = 15;
    int iCurrentLoop = 1;
    object oRefPoint = GetObjectByTag("Reference_Crypt_03");
    int iRandomFence;
    object oFence;
    effect eVFX = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_GREASE);
    effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);

    if (bMazeOn == TRUE)
    {
        while (iCurrentLoop <= iMaxLoop)
        {
            //Select a random fence
            iRandomFence = Random(iFenceCount)+1;
            oFence = GetNearestObjectByTag("FenceMaze", oRefPoint, iRandomFence);

            //Try to avoid catching the same fence twice.
            int bDestroyed = GetLocalInt(oFence, "bDestroyed");
            if (bDestroyed == FALSE)
            {
                //Flag it as destroyed.
                SetLocalInt(oFence, "bDestroyed", TRUE);

                //Remember its location
                location lFence = GetLocation(oFence);

                //Identify its invisible twin.
                object oFenceInvis = GetNearestObjectByTag("FenceMaze_Invis", oFence);

                //Delete fence and invisible twin and respawn them on a delay
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInvis, oFence);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lFence);
                DestroyObject(oFence);
                DestroyObject(oFenceInvis);
                DelayCommand(9.0, CreateFence(lFence));
            }

            //Update the loop count
            iCurrentLoop++;
        }

        //If there are no undead left in the area, allow resting.
        object oUndead = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_UNDEAD, oRefPoint);
        int bAllowRest = GetLocalInt(OBJECT_SELF, "bAllowRest");
        if (oUndead == OBJECT_INVALID && bAllowRest == FALSE)
        {
            SetLocalInt(OBJECT_SELF, "bAllowRest", TRUE);
        }
    }

    //Re-signal the UD Event in 6 seconds
    DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(5001)));
}
