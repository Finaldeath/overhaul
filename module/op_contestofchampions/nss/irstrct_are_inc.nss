//////////////////////////////////////////////////////////////
// irstrct_are_inc :: Default Include file for item restrictions
//                    area.
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
//////////////////////////////////////////////////////////////

int IncrementNumPlayers();
int DecrementNumPlayers();
void DoAreaCleanUp();

//////////////////////////////////////////////////////////////
// IncrementNumPlayers()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Descriptin: Increments the stored number of players on the
//             area. This function should only ever be called
//             in area specific scripts. ie: Area scripts.
//////////////////////////////////////////////////////////////
int IncrementNumPlayers()
{
    int nNumPlayers;

    nNumPlayers = GetLocalInt(OBJECT_SELF,"m_nNumPlayers");
    nNumPlayers += 1;

    SetLocalInt(OBJECT_SELF,"m_nNumPlayers",nNumPlayers);

    return nNumPlayers;
}

//////////////////////////////////////////////////////////////
// DecrementNumPlayers()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Descriptin: Decrements the stored number of players on the
//             area. This function should only ever be called
//             in area specific scripts. ie: Area scripts.
//////////////////////////////////////////////////////////////
int DecrementNumPlayers()
{
    int nNumPlayers;

    nNumPlayers = GetLocalInt(OBJECT_SELF,"m_nNumPlayers");
    nNumPlayers -= 1;

    SetLocalInt(OBJECT_SELF,"m_nNumPlayers",nNumPlayers);

    return nNumPlayers;
}

//////////////////////////////////////////////////////////////
// DoAreaCleanUp()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Descriptin: Cleans up all items on the ground and in the
//             trash objects. This function should only ever be
//             called in area specific scripts. ie: Area scripts.
//////////////////////////////////////////////////////////////
void DoAreaCleanUp()
{
    object oTrash, oItem;
    int nTrashIndex;

    oItem = GetFirstObjectInArea(OBJECT_SELF);
    while ( GetIsObjectValid(oItem) == TRUE )
    {
        if ( GetObjectType(oItem) == OBJECT_TYPE_ITEM )
        {
            DestroyObject(oItem);
            oItem = GetNextObjectInArea(OBJECT_SELF);
        }
    }

    nTrashIndex = 0;
    oTrash = GetObjectByTag("irstrct_trash",nTrashIndex);
    while ( GetIsObjectValid(oTrash) == TRUE )
    {
        oItem = GetFirstItemInInventory(oTrash);
        while ( GetIsObjectValid(oItem) == TRUE )
        {
            DestroyObject(oItem);
            oItem = GetNextItemInInventory(oTrash);
        }

        ++nTrashIndex;
        oTrash = GetObjectByTag("irstrct_trash",nTrashIndex);
    }
}
