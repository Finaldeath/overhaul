//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_spawn_devil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will refill the devils as they die.
     Only affects non-throwers.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 19, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444)
    {
        string sCreature;
        int x = Random(100);
        int iCount = GetLocalInt(OBJECT_SELF, "HX_HELL_BATTLE_COUNT");

        if(x > 90)
        {
            sCreature = "hx_hell_pitfiend";
        }
        else if(x > 45)
        {
            sCreature = "hx_fire_imp";
        }
        else
        {
            sCreature = "hx_hell_erin";
        }

        if(iCount <= 30)
        {
            CreateObject(OBJECT_TYPE_CREATURE, sCreature, GetLocation(OBJECT_SELF));
            DestroyObject(OBJECT_SELF);
        }
        else
        {
            SetLocalInt(OBJECT_SELF, "HX_HELL_BATTLE_COUNT", iCount + 1);
        }
    }
}
