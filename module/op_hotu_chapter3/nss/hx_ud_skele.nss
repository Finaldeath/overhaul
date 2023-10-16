//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_skele
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Creates skeletons after a Walking Bone Mass
     has been killed.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////

// Delayed CreateObject
void DelayCreateObject(int iType, string sName, location lLoc)
{
    SetLocalInt(GetArea(OBJECT_SELF), "SIGNAL_PENDING", 0);
    CreateObject(iType, sName, lLoc);
}

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 4444)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        string sBones = "q4a_headstone";
        string sSkele = "skeletalminion";
        // Bone counter. We only want 4 skeles each time.
        int x = 1;
        float fDelay = 0.0;
        object oBones = GetNearestObjectByTag(sBones, oPC, x);

        if(GetIsObjectValid(oBones))
        {
            while(x < 5)
            {
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_RAISE_DEAD), oBones));
                DelayCommand(fDelay, DelayCreateObject(OBJECT_TYPE_CREATURE, sSkele, GetLocation(oBones)));
                DelayCommand(fDelay + 2.0, DestroyObject(oBones));
                fDelay = fDelay + 0.5;
                x = x + 1;
                oBones = GetNearestObjectByTag(sBones, oPC, x);
            }

        }
    }
}
