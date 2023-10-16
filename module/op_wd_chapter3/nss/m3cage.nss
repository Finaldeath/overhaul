// * First time area is loaded, create the Succubbi cage
// * Imprisons an object in a cage
string sNode = "M3Node";
float fMainSpace = 1.2;
float fMinorSpace = 0.82;

float nHeight = 3.0;

//* returns the last 'top' node
object BuildBeam(location lLoc, int nBeam, object oLastTop=OBJECT_INVALID)
{
    object o1 = CreateObject(OBJECT_TYPE_PLACEABLE, sNode, lLoc);
    vector vPos = GetPositionFromLocation(lLoc);
    vPos.z = vPos.z + nHeight;
    lLoc = Location(GetAreaFromLocation(lLoc), vPos, GetFacingFromLocation(lLoc));
    object o2 = CreateObject(OBJECT_TYPE_PLACEABLE, sNode, lLoc);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(nBeam, o1, BODY_NODE_CHEST), o2);
    // * if there is a valid last top then connect the two tops
    if (GetIsObjectValid(oLastTop) == TRUE)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(nBeam, o2, BODY_NODE_CHEST), oLastTop);
    }

    return o2;
}

void Cage(object oCaptured)
{

    location lLoc1;
 //* inner bars
    /*
         _1   _2

         _5 s

         _4   _3
    */
    object oLastTop = OBJECT_INVALID;
    // * _1
    lLoc1 = Location( GetArea(oCaptured), GetPosition(oCaptured) + Vector(-fMinorSpace, fMainSpace, 0.0f), 0.0f);
    oLastTop = BuildBeam(lLoc1, VFX_BEAM_FIRE, OBJECT_INVALID);
    object oFirst = oLastTop;

    // * _2
    lLoc1 = Location( GetArea(oCaptured), GetPosition(oCaptured) + Vector(fMainSpace, fMinorSpace, 0.0f), 0.0f);
    oLastTop =BuildBeam(lLoc1, VFX_BEAM_FIRE, oLastTop);

    // * _3
    lLoc1 = Location( GetArea(oCaptured), GetPosition(oCaptured) + Vector(fMinorSpace,-fMainSpace, 0.0f), 0.0f);
    oLastTop = BuildBeam(lLoc1, VFX_BEAM_FIRE, oLastTop);

    // * _4
    lLoc1 = Location( GetArea(oCaptured), GetPosition(oCaptured) + Vector(-fMainSpace, -fMinorSpace, 0.0f), 0.0f);
    oLastTop =BuildBeam(lLoc1, VFX_BEAM_FIRE, oLastTop);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_FIRE, oFirst, BODY_NODE_CHEST), oLastTop);

    // * _5
    lLoc1 = Location( GetArea(oCaptured), GetPosition(oCaptured) + Vector(-fMainSpace, 0.0f, 0.0f), 0.0f);
    oLastTop =BuildBeam(lLoc1, VFX_BEAM_COLD, OBJECT_INVALID);




    //* outer bars

    lLoc1 = Location( GetArea(oCaptured), GetPosition(oCaptured) + Vector(fMainSpace, 0.0f, 0.0f), 0.0f);
    oLastTop =BuildBeam(lLoc1, VFX_BEAM_COLD, OBJECT_INVALID);
    lLoc1 = Location( GetArea(oCaptured), GetPosition(oCaptured) + Vector(0.0f, fMainSpace, 0.0f), 0.0f);
    oLastTop =BuildBeam(lLoc1, VFX_BEAM_COLD, OBJECT_INVALID);
    lLoc1 = Location( GetArea(oCaptured), GetPosition(oCaptured) + Vector(0.0f, -fMainSpace, 0.0f), 0.0f);
    oLastTop =BuildBeam(lLoc1, VFX_BEAM_COLD, OBJECT_INVALID);

//    AssignCommand(oCaptured, ActionPlayAnimation(ANIMATION_));
}

void main()
{
 if (GetLocalInt(OBJECT_SELF, "NW_L_CREATE_CAGE") == 0)
 {
    SetLocalInt(OBJECT_SELF, "NW_L_CREATE_CAGE",2);
    Cage(GetObjectByTag("M3Q3BALOR"));
 }
}
