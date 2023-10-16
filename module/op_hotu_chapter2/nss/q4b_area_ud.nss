// upper golem level user defined event


void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // init numbers
    {
       // destroying any existing vertices:
       int i;
       string sTag1, sTag2;
       object oV1, oV2;
       for(i = 1; i <= 6; i++)
       {
           sTag1 = "q4b_vertex_a" + IntToString(i);
           sTag2 = "q4b_vertex_b" + IntToString(i);
           oV1 = GetObjectByTag(sTag1);
           oV2 = GetObjectByTag(sTag2);
           DestroyObject(oV1);
           DestroyObject(oV2);
       }
       // Setting number beams
       object oWPa1 = GetObjectByTag("q4b_wp_number_a1");
       object oWPa2 = GetObjectByTag("q4b_wp_number_a2");

       vector vPosA1 = GetPosition(oWPa1);
       vector vPosA3 = GetPosition(oWPa1);
       vector vPosA5 = GetPosition(oWPa1);
       vPosA1.z += 1.5;
       vPosA3.z += 3.0;
       vPosA5.z += 4.5;

       vector vPosA2 = GetPosition(oWPa2);
       vector vPosA4 = GetPosition(oWPa2);
       vector vPosA6 = GetPosition(oWPa2);
       vPosA2.z += 1.5;
       vPosA4.z += 3.0;
       vPosA6.z += 4.5;

       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosA1, 0.0), FALSE, "q4b_vertex_a1");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosA2, 0.0), FALSE, "q4b_vertex_a2");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosA3, 0.0), FALSE, "q4b_vertex_a3");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosA4, 0.0), FALSE, "q4b_vertex_a4");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosA5, 0.0), FALSE, "q4b_vertex_a5");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosA6, 0.0), FALSE, "q4b_vertex_a6");


       object oWPb1 = GetObjectByTag("q4b_wp_number_b1");
       object oWPb2 = GetObjectByTag("q4b_wp_number_b2");

       vector vPosB1 = GetPosition(oWPb1);
       vector vPosB3 = GetPosition(oWPb1);
       vector vPosB5 = GetPosition(oWPb1);
       vPosB1.z += 1.5;
       vPosB3.z += 3.0;
       vPosB5.z += 4.5;

       vector vPosB2 = GetPosition(oWPb2);
       vector vPosB4 = GetPosition(oWPb2);
       vector vPosB6 = GetPosition(oWPb2);
       vPosB2.z += 1.5;
       vPosB4.z += 3.0;
       vPosB6.z += 4.5;

       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosB1, 0.0), FALSE, "q4b_vertex_b1");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosB2, 0.0), FALSE, "q4b_vertex_b2");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosB3, 0.0), FALSE, "q4b_vertex_b3");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosB4, 0.0), FALSE, "q4b_vertex_b4");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosB5, 0.0), FALSE, "q4b_vertex_b5");
       CreateObject(OBJECT_TYPE_PLACEABLE, "q4b_vertex", Location(OBJECT_SELF, vPosB6, 0.0), FALSE, "q4b_vertex_b6");

    }
}

