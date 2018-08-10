CREATE NONCLUSTERED INDEX [i_apogeeObject_apogee_id_j_h_k_j] ON [dbo].[apogeeObject](apogee_id ASC, j ASC, h ASC, k ASC, j_err ASC, h_err ASC, k_err ASC) 
----
CREATE NONCLUSTERED INDEX [i_apogeeStar_apogee_id] ON [dbo].[apogeeStar](apogee_id ASC) 
----
CREATE NONCLUSTERED INDEX [i_apogeeStar_htmID] ON [dbo].[apogeeStar](htmID ASC) 
----
CREATE NONCLUSTERED INDEX [i_apogeeVisit_apogee_id] ON [dbo].[apogeeVisit](apogee_id ASC) 
----
CREATE NONCLUSTERED INDEX [i_apogeeVisit_plate_mjd_fiberid] ON [dbo].[apogeeVisit](plate ASC, mjd ASC, fiberid ASC) 
----
CREATE NONCLUSTERED INDEX [i_aspcapStar_apstar_id] ON [dbo].[aspcapStar](apstar_id ASC) 
----
CREATE NONCLUSTERED INDEX [i_DataConstants_value] ON [dbo].[DataConstants](value ASC) 
----
CREATE NONCLUSTERED INDEX [i_PlateX_htmID_ra_dec_cx_cy_cz] ON [dbo].[PlateX](htmID ASC, ra ASC, dec ASC, cx ASC, cy ASC, cz ASC) 
----
CREATE NONCLUSTERED INDEX [i_SpecObjAll_BestObjID_sourceTyp] ON [dbo].[SpecObjAll](bestObjID ASC, sourceType ASC, sciencePrimary ASC, class ASC, htmID ASC, ra ASC, dec ASC, plate ASC, mjd ASC, fiberID ASC, z ASC, zErr ASC) 
----
CREATE NONCLUSTERED INDEX [i_SpecObjAll_class_zWarning_z_sc] ON [dbo].[SpecObjAll](class ASC, zWarning ASC, z ASC, sciencePrimary ASC, plateID ASC, bestObjID ASC, targetObjID ASC, htmID ASC, ra ASC, dec ASC) 
----
CREATE NONCLUSTERED INDEX [i_SpecObjAll_fluxObjID] ON [dbo].[SpecObjAll](fluxObjID ASC) 
----
CREATE NONCLUSTERED INDEX [i_SpecObjAll_htmID_ra_dec_cx_cy_] ON [dbo].[SpecObjAll](htmID ASC, ra ASC, dec ASC, cx ASC, cy ASC, cz ASC, sciencePrimary ASC) 
----
CREATE NONCLUSTERED INDEX [i_SpecObjAll_ra_dec_class_plat] ON [dbo].[SpecObjAll](ra ASC, dec ASC, class ASC, plate ASC, tile ASC, z ASC, zErr ASC, sciencePrimary ASC, plateID ASC, bestObjID ASC) 
----
CREATE NONCLUSTERED INDEX [i_SpecObjAll_targetObjID_sourceT] ON [dbo].[SpecObjAll](targetObjID ASC, sourceType ASC, sciencePrimary ASC, class ASC, htmID ASC, ra ASC, dec ASC) 
----
CREATE NONCLUSTERED INDEX [i_SpecPhotoAll_objID_sciencePrim] ON [dbo].[SpecPhotoAll](objID ASC, sciencePrimary ASC, class ASC, z ASC, targetObjID ASC) 
----
CREATE NONCLUSTERED INDEX [i_SpecPhotoAll_targetObjID_scien] ON [dbo].[SpecPhotoAll](targetObjID ASC, sciencePrimary ASC, class ASC, z ASC, objID ASC) 
----
CREATE NONCLUSTERED INDEX [i_zooConfidence_objID] ON [dbo].[zooConfidence](objid ASC) 
----
CREATE NONCLUSTERED INDEX [i_zooSpec_objID] ON [dbo].[zooSpec](objid ASC) 
----