// * temporary start war

void main()
{
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTCOM", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM")));
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTCOM2", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM2")));
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTCOM3", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM3")));
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTC004", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM4")));
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTC005", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM5")));
        CreateObject(OBJECT_TYPE_CREATURE, "M3Q2A05_PULTC006", GetLocation(GetObjectByTag("POST_M3Q2A05_PULTCOM6")));

        SpeakString("The war begins...");
}
