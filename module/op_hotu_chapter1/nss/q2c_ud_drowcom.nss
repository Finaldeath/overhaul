///////////////////////////////////////////////
//:: Surrender User Defined
//:: SURRENDER_UDEF
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through a 20ft radius around the NPC and
    sets all people to clear all actions and
    improves the reputation of enemies towards the
    NPC and clears their actions
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 16, 2001
//:://////////////////////////////////////////////
//:: May 2002: Don't surrender if dead

void FleeInTerror();

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser == 1002)
    {
        if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") ==0)
        {
//            ActionStartConversation(OBJECT_SELF);
            SpeakOneLinerConversation();
            SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
        }
    }
    else
    if(nUser == 1006)
    {
        /*int nMaxHP = GetMaxHitPoints();
        int nCurrHP = GetCurrentHitPoints();

         // * generic surrender should only fire once

        if((GetIsDead(OBJECT_SELF) == FALSE) && (nCurrHP <= 30) && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0)
        {
            SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
            //SurrenderToEnemies();
            ClearAllActions();
            SpeakOneLinerConversation();
            ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 3.0);
            GiveXPToCreature(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), 10 * FloatToInt(GetChallengeRating(OBJECT_SELF)));
            DelayCommand(2.5, FleeInTerror());
        }
        */
    }
}
/*
void FleeInTerror()
{
    location lLoc = GetLocation(OBJECT_SELF);

    //teleport effect
    effect ePoof = EffectVisualEffect(VFX_IMP_HEALING_G);

    //PC's current location
    vector vUser = GetPosition(OBJECT_SELF);
    vUser = Vector(vUser.x, vUser.y, vUser.z + 1.0);
    location lUser1 = Location(GetArea(OBJECT_SELF), vUser, 0.0);

    //Target location
    vector vTarget = GetPositionFromLocation(lLoc);
    vTarget = Vector(vTarget.x, vTarget.y, vTarget.z + 1.0);
    location lTarget1 = Location(GetAreaFromLocation(lLoc), vTarget, 0.0);


    //Apply teleport effect at current location
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, GetLocation(OBJECT_SELF));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lUser1);

    //Apply teleport effect at target location
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lLoc));
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTarget1));

    DestroyObject(OBJECT_SELF, 1.0);

}



