void main()
{
SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusOrder",0);
SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusChoice",0);
int nNum = GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusDoorCount");

int nRandom = 0;
int nDoorUsed = 0;

if(GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusDoorCount") < 6)
    {
    while(nDoorUsed == 0)
    {
        nRandom = Random(6);
        switch (nRandom)
        {
            case 0:
            {
            if(GetLocked(GetObjectByTag("M2Q2DSARC21")) == TRUE)
            //* Unlock Door 21
            {
            ActionOpenDoor(GetObjectByTag("M2Q2DSARC21"));
            SetLocked(GetObjectByTag("M2Q2DSARC21"),0);
            nDoorUsed = 1;
            nNum = nNum + 1;
            SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusDoorCount",nNum);
            }
            }
            break;
            case 1:
            {
            if(GetLocked(GetObjectByTag("M2Q2DSARC22")) == TRUE)
            //* Unlock Door 22
            {
            ActionOpenDoor(GetObjectByTag("M2Q2DSARC22"));
            SetLocked(GetObjectByTag("M2Q2DSARC22"),0);
            nDoorUsed = 1;
            nNum = nNum + 1;
            SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusDoorCount",nNum);
            }
            }
            break;
            case 2:
            {
            if(GetLocked(GetObjectByTag("M2Q2DSARC23")) == TRUE)
            {
            //* Unlock Door 23
            ActionOpenDoor(GetObjectByTag("M2Q2DSARC23"));
            SetLocked(GetObjectByTag("M2Q2DSARC23"),0);
            nDoorUsed = 1;
            nNum = nNum + 1;
            SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusDoorCount",nNum);
            CreateObject(OBJECT_TYPE_CREATURE,"M2Q2C2DOOMKNIGHT",GetLocation(GetWaypointByTag("WP_M2Q2DSARC23")));
            }
            }
            break;
            case 3:
            {
            if(GetLocked(GetObjectByTag("M2Q2DSARC24")) == TRUE)
            {
            //* Unlock Door 24
            ActionOpenDoor(GetObjectByTag("M2Q2DSARC24"));
            SetLocked(GetObjectByTag("M2Q2DSARC24"),0);
            nDoorUsed = 1;
            nNum = nNum + 1;
            SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusDoorCount",nNum);
            CreateObject(OBJECT_TYPE_CREATURE,"M2Q2C2SKELWAR",GetLocation(GetWaypointByTag("WP_M2Q2DSARC24")));
            }
            }
            break;
            case 4:
            {
            if(GetLocked(GetObjectByTag("M2Q2DSARC25")) == TRUE)
            //* Unlock Door 25
            {
            ActionOpenDoor(GetObjectByTag("M2Q2DSARC25"));
            SetLocked(GetObjectByTag("M2Q2DSARC25"),0);
            nDoorUsed = 1;
            nNum = nNum + 1;
            SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusDoorCount",nNum);
            CreateObject(OBJECT_TYPE_CREATURE,"M2Q2C2MUMMY",GetLocation(GetWaypointByTag("WP_M2Q2DSARC25")));
            }
            }
            break;
            case 5:
            {
            if(GetLocked(GetObjectByTag("M2Q2DSARC26")) == TRUE)
            //* Unlock Door 26
            {
            ActionOpenDoor(GetObjectByTag("M2Q2DSARC26"));
            SetLocked(GetObjectByTag("M2Q2DSARC26"),0);
            nDoorUsed = 1;
            nNum = nNum + 1;
            SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusDoorCount",nNum);
            CreateObject(OBJECT_TYPE_CREATURE,"M2Q2C2DOOMKNIGHT",GetLocation(GetWaypointByTag("WP_M2Q2DSARC26")));
            }
            }
            break;
        }
    }
    }
}
