// Path puzzle effect: find the other path object that has the same tag as this one, and fire
// effects all the way until that object.

float EFFECT_JUMP = 1.0;
float EFFECT_INTERVAL = 0.1;

void main()
{
    object oTarget = GetNearestObjectByTag(GetTag(OBJECT_SELF));
    if(oTarget == OBJECT_INVALID)
        return;
    //SpeakString("EFFECT: " + GetTag(OBJECT_SELF) + " found twin at distance=" + FloatToString(GetDistanceBetween(OBJECT_SELF, oTarget)));

    string sTag = GetTag(OBJECT_SELF);
    int nLen = GetStringLength(sTag);
    int nNewLen = nLen - 1; // remove the number at the end
    sTag = GetStringLeft(sTag, nNewLen);
    int nVis;

   //SpeakString("EFFECT: " + GetTag(OBJECT_SELF) + " BASE TAG=" + sTag);

    if(sTag == "Q3_PATHEFF_FIRE")
        nVis = VFX_FNF_GAS_EXPLOSION_FIRE;
    else if(sTag == "Q3_PATHEFF_WATER")
        nVis = VFX_FNF_GAS_EXPLOSION_MIND;
    else if(sTag == "Q3_PATHEFF_AIR")
        nVis = VFX_FNF_SMOKE_PUFF;
    else if(sTag == "Q3_PATHEFF_EARTH")
        nVis = VFX_FNF_GAS_EXPLOSION_ACID;

    effect eVis = EffectVisualEffect(nVis);

    vector vSource = GetPosition(OBJECT_SELF);
    vector vTarget = GetPosition(oTarget);

    float fDistanceY; // y-axis distance between two points
    float fDistanceX; // x-axis distance between two points

    // finding the farthest (y or x axis) distance between the two points.
    // and so if the x is the farthest then this axes would be used to find locations for the effects
    // and vice versa.

    int nIncDec = 0; // whether to increase (0) or decrease (1) the x or y for each new effect location

    if(vSource.y > vTarget.y)
    {
        nIncDec = 1;
        fDistanceY =  vSource.y - vTarget.y;
    }
    else
    {
        nIncDec = 0;
        fDistanceY =  vTarget.y - vSource.y;
    }

    if(vSource.x > vTarget.x)
    {
        nIncDec = 1;
        fDistanceX = vSource.x - vTarget.x;
    }
    else
    {
        nIncDec = 0;
        fDistanceX = vTarget.x - vSource.x;
    }

    vector vCurrent = vSource; // the current effect vector
    location lCurrent = GetLocation(OBJECT_SELF); // the current effect location
    float fDelay = 0.0;

    if(fDistanceX > fDistanceY) // the 2 points are on the X axis
    {
        if(nIncDec == 0) // need to increment the X axis until getting to the target
        {
            while(vCurrent.x < vTarget.x)
            {
                lCurrent = Location(GetArea(OBJECT_SELF), vCurrent, 0.0);
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lCurrent));
                fDelay += EFFECT_INTERVAL;
                vCurrent.x += EFFECT_JUMP;
            }
        }
        else // need to decrement the X axis until getting to the target
        {
            while(vCurrent.x > vTarget.x)
            {
                lCurrent = Location(GetArea(OBJECT_SELF), vCurrent, 0.0);
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lCurrent));
                fDelay += EFFECT_INTERVAL;
                vCurrent.x -= EFFECT_JUMP;
            }
        }

    }
    else // the 2 points are on the Y axis.
    {
        if(nIncDec == 0) // need to increment the X axis until getting to the target
        {
            while(vCurrent.y < vTarget.y)
            {
                lCurrent = Location(GetArea(OBJECT_SELF), vCurrent, 0.0);
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lCurrent));
                fDelay += EFFECT_INTERVAL;
                vCurrent.y += EFFECT_JUMP;
            }
        }
        else // need to decrement the X axis until getting to the target
        {
            while(vCurrent.y > vTarget.y)
            {
                lCurrent = Location(GetArea(OBJECT_SELF), vCurrent, 0.0);
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lCurrent));
                fDelay += EFFECT_INTERVAL;
                vCurrent.y -= EFFECT_JUMP;
            }
        }
    }
}
