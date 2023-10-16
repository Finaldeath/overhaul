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
            string sFire = "M3Q3FIREELEM1";
            effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);

            location lFireSpawn = GetLocation(GetWaypointByTag("WP_M3Q3FIRESPAWN_01"));

            effect eVisNode1 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING1"), BODY_NODE_CHEST);
            DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode1, GetNearestObjectByTag("M3Q3B_LIGHTNING2"),6.0));
            effect eVisNode2 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING2"), BODY_NODE_CHEST);
            DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode2, GetNearestObjectByTag("M3Q3B_LIGHTNING3"),6.0));
            effect eVisNode3 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING3"), BODY_NODE_CHEST);
            DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode3, GetNearestObjectByTag("M3Q3B_LIGHTNING4"),6.0));
            effect eVisNode4 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING4"), BODY_NODE_CHEST);
            DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode4, GetNearestObjectByTag("M3Q3B_LIGHTNING1"),6.0));

            DelayCommand(20.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lFireSpawn));
            DelayCommand(20.0,CreateFireElemental(sFire,lFireSpawn));
        }
        break;
    case 301:
        {
        string sFire = "M3Q3FIREELEM2";
        effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        location lFireSpawn = GetLocation(GetWaypointByTag("WP_M3Q3FIRESPAWN_01"));

        effect eVisNode1 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING1"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode1, GetNearestObjectByTag("M3Q3B_LIGHTNING2"),6.0));
        effect eVisNode2 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING2"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode2, GetNearestObjectByTag("M3Q3B_LIGHTNING3"),6.0));
        effect eVisNode3 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING3"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode3, GetNearestObjectByTag("M3Q3B_LIGHTNING4"),6.0));
        effect eVisNode4 = EffectBeam(VFX_BEAM_LIGHTNING,GetNearestObjectByTag("M3Q3B_LIGHTNING4"), BODY_NODE_CHEST);
        DelayCommand(20.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVisNode4, GetNearestObjectByTag("M3Q3B_LIGHTNING1"),6.0));

        DelayCommand(20.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lFireSpawn));
        DelayCommand(20.0,CreateFireElemental(sFire,lFireSpawn));
        }
        break;
   }
}
