//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_spawn_orb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will spawn the orbs in on the pedastels
     as the bone golems are destroyed. The 3 orbs
     will each hold a piece of the ring that the
     Sleeping Man speaks of.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

void DelayCreate(int iType, string sRes, location lLoc);

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
    else if(nUser == 5555) // Custom
    {
        object oGarg = GetObjectByTag("q4a_garg_skele4x");
        int iCount = GetLocalInt(OBJECT_SELF, "HX_GolemsKilled");
        string sOrb;
        vector vGlobe;
        location lLoc;

        // Choose which globe to spawn in. Then set its loc.
        if(iCount == 0)
        {
            sOrb = "hx_essence_orb";
            vGlobe = Vector(35.21, 110.07, 1.25);
            lLoc = Location(GetArea(OBJECT_SELF), vGlobe, 0.0);
            SetLocalInt(OBJECT_SELF, "HX_GolemsKilled", 1);
        }
        else if(iCount == 1)
        {
            sOrb = "hx_essence_orb2";
            vGlobe = Vector(40.03, 109.98, 1.25);
            lLoc = Location(GetArea(OBJECT_SELF), vGlobe, 0.0);
            SetLocalInt(OBJECT_SELF, "HX_GolemsKilled", 2);
        }
        else
        {
            sOrb = "hx_essence_orb3";
            vGlobe = Vector(45.09, 109.98, 1.25);
            lLoc = Location(GetArea(OBJECT_SELF), vGlobe, 0.0);
            SetLocalInt(OBJECT_SELF, "HX_GolemsKilled", 3);
        }
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES), lLoc);
        DelayCommand(1.0, DelayCreate(OBJECT_TYPE_PLACEABLE, sOrb, lLoc));
        // Start the next batch of skeletons.
        DelayCommand(4.0, SignalEvent(oGarg, EventUserDefined(4444)));
    }

}

// Delayed create.
void DelayCreate(int iType, string sRes, location lLoc)
{
    CreateObject(iType, sRes, lLoc);
}
