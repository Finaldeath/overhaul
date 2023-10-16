// Elemental spawn trigger on-enter event: spawn an elemental if the right path is activated.

int ACTIVE_PATH_NONE  = 0;
int ACTIVE_PATH_WATER = 1;
int ACTIVE_PATH_AIR   = 2;
int ACTIVE_PATH_EARTH = 3;
int ACTIVE_PATH_FIRE  = 4;

void Create(string s, object oWP)
{
    CreateObject(OBJECT_TYPE_CREATURE, s, GetLocation(oWP));
}

void main()
{
    //int nActivePath = GetLocalInt(GetArea(OBJECT_SELF), "Q3_CURRENT_ACTIVE_PATH");
    int nTriggerType = StringToInt(GetStringRight(GetTag(OBJECT_SELF), 1));

    //if(nTriggerType != nActivePath)
    //    return; // not the right path -> do nothing

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);


    string sElemental; // the elemental to create
    object oWP = GetNearestObjectByTag("Q3B_SPAWN");

    if(nTriggerType == ACTIVE_PATH_WATER)
        sElemental = "q3_water_element";
    else if(nTriggerType == ACTIVE_PATH_AIR)
        sElemental = "q3_air_element";
    else if(nTriggerType == ACTIVE_PATH_EARTH)
        sElemental = "q3_earth_element";
    else if(nTriggerType == ACTIVE_PATH_FIRE)
        sElemental = "q3_fire_element";

    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));

    DelayCommand(1.0, Create(sElemental, oWP));
}
