//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT)
    {
        int nRand  = d4();
        if(nRand <= 3) // run randomly
        {
            ClearAllActions();
            int i;
            vector vPos;
            float nRand1;
            float nRand2;
            float fOrin;
            location lLoc;
            for(i = 1; i <= 3; i++)
            {
                vPos = GetPosition(OBJECT_SELF);
                nRand1 = IntToFloat(Random(10) - 5);
                nRand2 = IntToFloat(Random(10) - 5);
                vPos.x += nRand1;
                vPos.y += nRand2;
                fOrin = IntToFloat(Random(360));
                lLoc = Location(GetArea(OBJECT_SELF), vPos, fOrin);
                ActionMoveToLocation(lLoc, TRUE);
            }
            ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 0.5, 2.0);

        }
    }
    return;

}
