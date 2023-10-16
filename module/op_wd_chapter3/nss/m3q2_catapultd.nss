//::///////////////////////////////////////////////
//:: Fire My Catapult
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Catches:
    2003: Means to fire the catapult
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November 2001
//:://////////////////////////////////////////////


// * creates junk near the impact
void MakeRubble(location lCenter)
{
    // * only 30% anything is created
    if (Random(30) + 1 < 30)
    {
        int nRandom = Random(10) + 1;
        string sTag;
        switch (nRandom)
        {
            case 1: case 2: sTag = "M3Q2_A05_SCORCH";
            break;
            case 3: case 4: case 5: case 6: sTag = "M3Q2_A05_FIRE";
            break;
            case 7: sTag = "M3Q2_A05_RUBBLE";
            break;
            case 8: case 9: case 10: sTag = "M3Q2_A05_FIRE";
            break;

        }
            int nVary = 2;
            // * if no valid tag then get out of here
            if (sTag == "")
              return;

       object oArea = GetAreaFromLocation(lCenter);
            vector vPosition = GetPositionFromLocation(lCenter);
            float fOrientation = GetFacingFromLocation(lCenter);
            //  * move impact location for debris a little
            float x = vPosition.x + Random(nVary);
            float y = vPosition.y + Random(nVary);
            float z = vPosition.z;
            vPosition = Vector(x,y,z);
            lCenter = Location(oArea, vPosition, fOrientation);
            object oCreated = CreateObject(OBJECT_TYPE_PLACEABLE, sTag, lCenter);
            DelayCommand(15.0, AssignCommand(oCreated, DestroyObject(OBJECT_SELF)));
    }
}
void MakeCatapultFire(object oBallista)
{
    effect eDam = EffectDamage(d10(), DAMAGE_TYPE_FIRE);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);

    // * assumes 5 Waypoints    ; chooses ones of them in its set

    int nRandom = Random(6) + 1;
    object oCenter = GetNearestObjectByTag("WP_"+GetTag(OBJECT_SELF)+"_" + IntToString(nRandom));
    PlaySound("cb_sh_catapult");
    AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FIREBALL, oCenter, METAMAGIC_ANY, TRUE,0, PROJECTILE_PATH_TYPE_BALLISTIC));
   // AssignCommand(oBallista, ActionCastFakeSpellAtObject(SPELL_FIREBALL, oCenter, PROJECTILE_PATH_TYPE_BALLISTIC));
    DelayCommand(1.0,MakeRubble(GetLocation(oCenter)));

}

void main()
{
    switch (GetUserDefinedEventNumber())
    {
        case 2003:
            //SpeakString("2003");
            SpeakOneLinerConversation();
            // *sets me as the commander for this catapult
            object oBallista = GetObjectByTag("M3Q2_A05C_PULT" + GetTag(OBJECT_SELF));
            SetLocalObject(oBallista,"M3Q2A05_MASTER",OBJECT_SELF);

            DelayCommand(Random(8) + 10.0, ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(2003))));
            if (GetIsInCombat() == FALSE)
                DelayCommand(3.0, ActionDoCommand(MakeCatapultFire(oBallista)));
        break;
    }
}
