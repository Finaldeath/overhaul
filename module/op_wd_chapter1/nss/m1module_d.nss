void main()
{
    int nEvent = GetUserDefinedEventNumber();
    int nNth;
    switch(nEvent)
    {
        case 600:
            DestroyObject(GetObjectByTag("m1Q04CHelmite"));
            DestroyObject(GetObjectByTag("M1Q02Chelmite"));
            DestroyObject(GetObjectByTag("M1Q05Helmite"));
            DestroyObject(GetObjectByTag("M1Gen_HumPriest"));
            nNth = 0;
            object oHelmiteEncounter = GetObjectByTag("ENC_M1Helm",nNth);
            while(GetIsObjectValid(oHelmiteEncounter))
            {
                SetEncounterActive(TRUE,oHelmiteEncounter);
                nNth++;
                oHelmiteEncounter = GetObjectByTag("ENC_M1Helm",nNth);
            }
        break;
    }
}
