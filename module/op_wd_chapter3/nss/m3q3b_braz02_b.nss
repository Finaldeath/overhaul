void CreateFireElemental(string sFire, location lFireSpawn)
{
    CreateObject(OBJECT_TYPE_CREATURE,sFire,lFireSpawn);
}

void main()
{
int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
    case 300:
        {
        string sFire = "M3Q3FIREELEM3";
        effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        location lFireSpawn = GetLocation(GetWaypointByTag("WP_M3Q3FIRESPAWN_02"));

        effect eVisNode1 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING5"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode1, GetNearestObjectByTag("M3Q3B_LIGHTNING6"),6.0));
        effect eVisNode2 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING6"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode2, GetNearestObjectByTag("M3Q3B_LIGHTNING7"),6.0));
        effect eVisNode3 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING7"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode3, GetNearestObjectByTag("M3Q3B_LIGHTNING8"),6.0));
        effect eVisNode4 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING8"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode4, GetNearestObjectByTag("M3Q3B_LIGHTNING5"),6.0));

        DelayCommand(20.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lFireSpawn));
        DelayCommand(20.0,CreateFireElemental(sFire,lFireSpawn));
        }
        break;
    case 301:
        {
        string sFire = "M3Q3FIREELEM4";
        effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        location lFireSpawn = GetLocation(GetWaypointByTag("WP_M3Q3FIRESPAWN_02"));

        effect eVisNode1 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING5"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode1, GetNearestObjectByTag("M3Q3B_LIGHTNING6"),6.0));
        effect eVisNode2 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING6"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode2, GetNearestObjectByTag("M3Q3B_LIGHTNING7"),6.0));
        effect eVisNode3 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING7"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode3, GetNearestObjectByTag("M3Q3B_LIGHTNING8"),6.0));
        effect eVisNode4 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING8"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode4, GetNearestObjectByTag("M3Q3B_LIGHTNING5"),6.0));

        DelayCommand(20.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lFireSpawn));
        DelayCommand(20.0,CreateFireElemental(sFire,lFireSpawn));
        }
        break;
   }
}
