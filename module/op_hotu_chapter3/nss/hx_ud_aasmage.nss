//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_aasmage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will give the caster a chance to flee
     from melee.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 27, 2003
//:://////////////////////////////////////////////
location GetFleeLocation(object oActor = OBJECT_SELF);

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

        if(GetIsObjectValid(oPC) && GetDistanceToObject(oPC) < 4.0)
        {
        // Give a chance the caster will flee.
            if(Random(100) >= 60)
            {
                ClearAllActions(TRUE);
                PlaySound("fs_flapfeather");
                DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDisappearAppear(GetFleeLocation()), OBJECT_SELF, 4.0));
                DelayCommand(4.2, PlaySound("fs_flapfeather"));
                //DelayCommand(5.6, ActionAttack(oTarget));
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        if(Random(100) < 35)
        {
            SpeakOneLinerConversation("");
        }
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

}

location GetFleeLocation(object oActor = OBJECT_SELF)
{
    vector vPos = GetPosition(oActor);
    vector vNew;
    location lLoc;

    float fX = IntToFloat(Random(10) + 5);
    float fY = IntToFloat(Random(10) + 5);

    if(Random(2) == 1)
    {
        fX = fX * -1.0;
    }
    if(Random(2) == 1)
    {
        fY = fY * -1.0;
    }

    vNew = Vector(vPos.x + fX, vPos.y + fY, vPos.z);
    lLoc = Location(GetArea(oActor), vNew, 0.0);

    return lLoc;
}
