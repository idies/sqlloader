use BESTTEST_DR14
 
ALTER TABLE [dbo].[apogeePlate] ADD CONSTRAINT [pk_apogeePlate_plate_visit_id] PRIMARY KEY CLUSTERED([plate_visit_id] ASC) 
 
ALTER TABLE [dbo].[apogeeStar] ADD CONSTRAINT [pk_apogeeStar_apstar_id] PRIMARY KEY CLUSTERED([apstar_id] ASC) 
 
ALTER TABLE [dbo].[apogeeStarAllVisit] ADD CONSTRAINT [pk_apogeeStarAllVisit_visit_id_a] PRIMARY KEY CLUSTERED([visit_id] ASC, [apstar_id] ASC) 
 
ALTER TABLE [dbo].[apogeeStarVisit] ADD CONSTRAINT [pk_apogeeStarVisit_visit_id] PRIMARY KEY CLUSTERED([visit_id] ASC) 
 
ALTER TABLE [dbo].[apogeeVisit] ADD CONSTRAINT [pk_apogeeVisit_visit_id] PRIMARY KEY CLUSTERED([visit_id] ASC) 
 
ALTER TABLE [dbo].[aspcapStar] ADD CONSTRAINT [pk_aspcapStar_aspcap_id] PRIMARY KEY CLUSTERED([aspcap_id] ASC) 
 
ALTER TABLE [dbo].[aspcapStarCovar] ADD CONSTRAINT [pk_aspcapStarCovar_aspcap_covar_] PRIMARY KEY CLUSTERED([aspcap_covar_id] ASC, [aspcap_id] ASC) 
 
ALTER TABLE [dbo].[AtlasOutline] ADD CONSTRAINT [pk_AtlasOutline_objID] PRIMARY KEY CLUSTERED([objID] ASC) 
 
ALTER TABLE [dbo].[DataConstants] ADD CONSTRAINT [pk_DataConstants_field_name] PRIMARY KEY CLUSTERED([field] ASC, [name] ASC) 
 
ALTER TABLE [dbo].[DBColumns] ADD CONSTRAINT [pk_DBColumns_tableName_name] PRIMARY KEY CLUSTERED([tablename] ASC, [name] ASC) 
 
ALTER TABLE [dbo].[DBObjects] ADD CONSTRAINT [pk_DBObjects_name] PRIMARY KEY CLUSTERED([name] ASC) 
 
ALTER TABLE [dbo].[DBViewCols] ADD CONSTRAINT [pk_DBViewCols_viewName_name] PRIMARY KEY CLUSTERED([viewname] ASC, [name] ASC) 
 
ALTER TABLE [dbo].[Dependency] ADD CONSTRAINT [pk_Dependency_parent_child] PRIMARY KEY CLUSTERED([parent] ASC, [child] ASC) 
 
ALTER TABLE [dbo].[detectionIndex] ADD CONSTRAINT [pk_detectionIndex_thingId_objID] PRIMARY KEY CLUSTERED([thingId] ASC, [objId] ASC) 
 
ALTER TABLE [dbo].[Diagnostics] ADD CONSTRAINT [pk_Diagnostics_name] PRIMARY KEY CLUSTERED([name] ASC) 
 
ALTER TABLE [dbo].[emissionLinesPort] ADD CONSTRAINT [pk_emissionLinesPort_specObjID] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[Field] ADD CONSTRAINT [pk_Field_fieldID] PRIMARY KEY CLUSTERED([fieldID] ASC) 
 
ALTER TABLE [dbo].[FieldProfile] ADD CONSTRAINT [pk_FieldProfile_fieldID_bin_band] PRIMARY KEY CLUSTERED([fieldID] ASC, [bin] ASC, [band] ASC) 
 
ALTER TABLE [dbo].[FileGroupMap] ADD CONSTRAINT [pk_FileGroupMap_tableName] PRIMARY KEY CLUSTERED([tableName] ASC) 
 
ALTER TABLE [dbo].[FIRST] ADD CONSTRAINT [pk_First_objID] PRIMARY KEY CLUSTERED([objID] ASC) 
 
ALTER TABLE [dbo].[Frame] ADD CONSTRAINT [pk_Frame_fieldID_zoom] PRIMARY KEY CLUSTERED([fieldID] ASC, [zoom] ASC) 
 
ALTER TABLE [dbo].[galSpecExtra] ADD CONSTRAINT [pk_galSpecExtra_specObjID] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[galSpecIndx] ADD CONSTRAINT [pk_galSpecIndx_specObjID] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[galSpecInfo] ADD CONSTRAINT [pk_galSpecInfo_specObjID] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[galSpecLine] ADD CONSTRAINT [pk_galSpecLine_specObjID] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[HalfSpace] ADD CONSTRAINT [pk_HalfSpace_constraintid] PRIMARY KEY CLUSTERED([constraintid] ASC) 
 
ALTER TABLE [dbo].[History] ADD CONSTRAINT [pk_History_id] PRIMARY KEY CLUSTERED([id] ASC) 
 
ALTER TABLE [dbo].[IndexMap] ADD CONSTRAINT [pk_IndexMap_indexmapid] PRIMARY KEY CLUSTERED([indexmapid] ASC) 
 
ALTER TABLE [dbo].[Inventory] ADD CONSTRAINT [pk_Inventory_filename_name] PRIMARY KEY CLUSTERED([filename] ASC, [name] ASC) 
 
ALTER TABLE [dbo].[LoadHistory] ADD CONSTRAINT [pk_LoadHistory_loadVersion_tStar] PRIMARY KEY CLUSTERED([loadversion] ASC, [tstart] ASC) 
 
ALTER TABLE [dbo].[mangaDrpAll] ADD CONSTRAINT [pk_mangaDrpAll_plateIFU] PRIMARY KEY CLUSTERED([plateifu] ASC) 
 
ALTER TABLE [dbo].[mangatarget] ADD CONSTRAINT [pk_mangaTarget_mangaID] PRIMARY KEY CLUSTERED([mangaID] ASC) 
 
ALTER TABLE [dbo].[marvelsStar] ADD CONSTRAINT [pk_marvelsStar_STARNAME_PLATE] PRIMARY KEY CLUSTERED([STARNAME] ASC, [Plate] ASC) 
 
ALTER TABLE [dbo].[marvelsVelocityCurveUF1D] ADD CONSTRAINT [pk_marvelsVelocityCurveUF1D_STAR] PRIMARY KEY CLUSTERED([STARNAME] ASC, [BEAM] ASC, [RADECID] ASC, [FCJD] ASC, [LST-OBS] ASC) 
 
ALTER TABLE [dbo].[Mask] ADD CONSTRAINT [pk_Mask_maskID] PRIMARY KEY CLUSTERED([maskID] ASC) 
 
ALTER TABLE [dbo].[MaskedObject] ADD CONSTRAINT [pk_MaskedObject_objid_maskid] PRIMARY KEY CLUSTERED([objid] ASC, [maskID] ASC) 
 
ALTER TABLE [dbo].[neighbors] ADD CONSTRAINT [pk_Neighbors_objID_NeighborObjID] PRIMARY KEY CLUSTERED([objID] ASC, [NeighborObjID] ASC) 
 
ALTER TABLE [dbo].[nsatlas] ADD CONSTRAINT [pk_nsatlas_nsaid] PRIMARY KEY CLUSTERED([nsaid] ASC) 
 
ALTER TABLE [dbo].[PartitionMap] ADD CONSTRAINT [pk_PartitionMap_fileGroupName] PRIMARY KEY CLUSTERED([fileGroupName] ASC) 
 
ALTER TABLE [dbo].[PhotoObjAll] ADD CONSTRAINT [pk_PhotoObjAll_objID] PRIMARY KEY CLUSTERED([objID] ASC) 
 
ALTER TABLE [dbo].[PhotoObjDR7] ADD CONSTRAINT [pk_PhotoObjDR7_dr8objID] PRIMARY KEY CLUSTERED([dr8objid] ASC) 
 
ALTER TABLE [dbo].[PhotoPrimaryDR7] ADD CONSTRAINT [pk_PhotoPrimaryDR7_dr8objID] PRIMARY KEY CLUSTERED([dr8objid] ASC) 
 
ALTER TABLE [dbo].[PhotoProfile] ADD CONSTRAINT [pk_PhotoProfile_objID_bin_band] PRIMARY KEY CLUSTERED([objID] ASC, [bin] ASC, [band] ASC) 
 
ALTER TABLE [dbo].[Photoz] ADD CONSTRAINT [pk_Photoz_objID] PRIMARY KEY CLUSTERED([objID] ASC) 
 
ALTER TABLE [dbo].[PhotozErrorMap] ADD CONSTRAINT [pk_PhotozErrorMap_cellID] PRIMARY KEY CLUSTERED([CellID] ASC) 
 
ALTER TABLE [dbo].[Plate2Target] ADD CONSTRAINT [pk_plate2target_plate2targetid_plate_objid] PRIMARY KEY CLUSTERED([plate2targetid] ASC, [plate] ASC, [objid] ASC) 
 
ALTER TABLE [dbo].[PlateX] ADD CONSTRAINT [pk_PlateX_plateID] PRIMARY KEY CLUSTERED([plateID] ASC) 
 
ALTER TABLE [dbo].[ProfileDefs] ADD CONSTRAINT [pk_ProfileDefs_bin] PRIMARY KEY CLUSTERED([bin] ASC) 
 
ALTER TABLE [dbo].[ProperMotions] ADD CONSTRAINT [pk_ProperMotions_objID] PRIMARY KEY CLUSTERED([objid] ASC) 
 
ALTER TABLE [dbo].[PubHistory] ADD CONSTRAINT [pk_PubHistory_name_loadversion] PRIMARY KEY CLUSTERED([name] ASC, [loadversion] ASC) 
 
ALTER TABLE [dbo].[qsoVarPTF] ADD CONSTRAINT [pk_qsoVarPTF_VAR_OBJID] PRIMARY KEY CLUSTERED([VAR_OBJID] ASC) 
 
ALTER TABLE [dbo].[qsoVarStripe] ADD CONSTRAINT [pk_qsoVarStripe_VAR_OBJID] PRIMARY KEY CLUSTERED([VAR_OBJID] ASC) 
 
ALTER TABLE [dbo].[QueryResults] ADD CONSTRAINT [pk_QueryResults_query_time] PRIMARY KEY CLUSTERED([query] ASC, [time] ASC) 
 
ALTER TABLE [dbo].[RC3] ADD CONSTRAINT [pk_RC3_objID] PRIMARY KEY CLUSTERED([objID] ASC) 
 
ALTER TABLE [dbo].[RecentQueries] ADD CONSTRAINT [pk_RecentQueries_ipAddr_lastQuer] PRIMARY KEY CLUSTERED([ipAddr] ASC, [lastQueryTime] ASC) 
 
ALTER TABLE [dbo].[Region] ADD CONSTRAINT [pk_Region_regionId] PRIMARY KEY CLUSTERED([regionid] ASC) 
 
ALTER TABLE [dbo].[RegionArcs] ADD CONSTRAINT [pk_RegionArcs_regionId_convexid_] PRIMARY KEY CLUSTERED([regionid] ASC, [convexid] ASC, [arcid] ASC) 
 
ALTER TABLE [dbo].[RegionPatch] ADD CONSTRAINT [pk_RegionPatch_regionid_convexid] PRIMARY KEY CLUSTERED([regionid] ASC, [convexid] ASC, [patchid] ASC) 
 
ALTER TABLE [dbo].[Rmatrix] ADD CONSTRAINT [pk_RMatrix_mode_row] PRIMARY KEY CLUSTERED([mode] ASC, [row] ASC) 
 
ALTER TABLE [dbo].[ROSAT] ADD CONSTRAINT [pk_Rosat_objID] PRIMARY KEY CLUSTERED([OBJID] ASC) 
 
ALTER TABLE [dbo].[RunShift] ADD CONSTRAINT [pk_RunShift_run] PRIMARY KEY CLUSTERED([run] ASC) 
 
ALTER TABLE [dbo].[SDSSConstants] ADD CONSTRAINT [pk_SDSSConstants_name] PRIMARY KEY CLUSTERED([name] ASC) 
 
ALTER TABLE [dbo].[sdssImagingHalfSpaces] ADD CONSTRAINT [pk_sdssImagingHalfspaces_sdssPol] PRIMARY KEY CLUSTERED([sdssPolygonID] ASC, [x] ASC, [y] ASC, [z] ASC) 
 
ALTER TABLE [dbo].[sdssPolygon2Field] ADD CONSTRAINT [pk_sdssPolygon2Field_sdssPolygon] PRIMARY KEY CLUSTERED([sdssPolygonID] ASC, [fieldID] ASC) 
 
ALTER TABLE [dbo].[sdssPolygons] ADD CONSTRAINT [pk_sdssPolygons_sdssPolygonID] PRIMARY KEY CLUSTERED([sdssPolygonID] ASC) 
 
ALTER TABLE [dbo].[sdssTargetParam] ADD CONSTRAINT [pk_sdssTargetParam_targetVersion] PRIMARY KEY CLUSTERED([targetVersion] ASC, [paramFile] ASC, [name] ASC) 
 
ALTER TABLE [dbo].[sdssTileAll] ADD CONSTRAINT [pk_sdssTileAll_tile] PRIMARY KEY CLUSTERED([tile] ASC) 
 
ALTER TABLE [dbo].[sdssTiledTargetAll] ADD CONSTRAINT [pk_sdssTiledTargetAll_targetID] PRIMARY KEY CLUSTERED([targetID] ASC) 
 
ALTER TABLE [dbo].[sdssTilingGeometry] ADD CONSTRAINT [pk_sdssTilingGeometry_tilingGeom] PRIMARY KEY CLUSTERED([tilingGeometryID] ASC) 
 
ALTER TABLE [dbo].[sdssTilingInfo] ADD CONSTRAINT [pk_sdssTilingInfo_tileRun_target] PRIMARY KEY CLUSTERED([tileRun] ASC, [targetID] ASC) 
 
ALTER TABLE [dbo].[sdssTilingRun] ADD CONSTRAINT [pk_sdssTilingRun_tileRun] PRIMARY KEY CLUSTERED([tileRun] ASC) 
 
ALTER TABLE [dbo].[segueTargetAll] ADD CONSTRAINT [pk_segueTargetAll_objID] PRIMARY KEY CLUSTERED([objid] ASC) 
 
ALTER TABLE [dbo].[SiteConstants] ADD CONSTRAINT [pk_SiteConstants_name] PRIMARY KEY CLUSTERED([name] ASC) 
 
ALTER TABLE [dbo].[SiteDiagnostics] ADD CONSTRAINT [pk_SiteDiagnostics_name] PRIMARY KEY CLUSTERED([name] ASC) 
 
ALTER TABLE [dbo].[SpecDR7] ADD CONSTRAINT [pk_SpecDR7_specObjID] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[SpecObjAll] ADD CONSTRAINT [pk_SpecObjAll_specObjID2] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[SpecPhotoAll] ADD CONSTRAINT [pk_SpecPhotoAll2_specObjID] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[sppLines] ADD CONSTRAINT [pk_sppLines_specObjID] PRIMARY KEY CLUSTERED([SPECOBJID] ASC) 
 
ALTER TABLE [dbo].[sppParams] ADD CONSTRAINT [pk_sppParams_specObjID] PRIMARY KEY CLUSTERED([SPECOBJID] ASC) 
 
ALTER TABLE [dbo].[stellarMassFSPSGranEarlyDust] ADD CONSTRAINT [pk_stellarMassFSPSGranEarlyDust_] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[stellarMassFSPSGranEarlyNoDust] ADD CONSTRAINT [pk_stellarMassFSPSGranEarlyNoDus] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[stellarMassFSPSGranWideDust] ADD CONSTRAINT [pk_stellarMassFSPSGranWideDust_s] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[stellarMassFSPSGranWideNoDust] ADD CONSTRAINT [pk_stellarMassFSPSGranWideNoDust] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[stellarMassPassivePort] ADD CONSTRAINT [pk_stellarMassPassivePort_specOb] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[stellarMassPCAWiscBC03] ADD CONSTRAINT [pk_stellarMassPCAWiscBC03_specOb] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[stellarMassPCAWiscM11] ADD CONSTRAINT [pk_stellarMassPCAWiscM11_specObj] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[stellarMassStarformingPort] ADD CONSTRAINT [pk_stellarMassStarformingPort_sp] PRIMARY KEY CLUSTERED([specObjID] ASC) 
 
ALTER TABLE [dbo].[StripeDefs] ADD CONSTRAINT [pk_StripeDefs_stripe] PRIMARY KEY CLUSTERED([stripe] ASC) 
 
ALTER TABLE [dbo].[Target] ADD CONSTRAINT [pk_Target_targetID] PRIMARY KEY CLUSTERED([targetID] ASC) 
 
ALTER TABLE [dbo].[TargetInfo] ADD CONSTRAINT [pk_TargetInfo_skyVersion_targetI] PRIMARY KEY CLUSTERED([skyVersion] ASC, [targetID] ASC) 
 
ALTER TABLE [dbo].[thingIndex] ADD CONSTRAINT [pk_thingIndex_thingId] PRIMARY KEY CLUSTERED([thingId] ASC) 
 
ALTER TABLE [dbo].[TwoMass] ADD CONSTRAINT [pk_TwoMass_objID] PRIMARY KEY CLUSTERED([objID] ASC) 
 
ALTER TABLE [dbo].[TwoMassXSC] ADD CONSTRAINT [pk_TwoMassXSC_objID] PRIMARY KEY CLUSTERED([objID] ASC) 
 
ALTER TABLE [dbo].[USNO] ADD CONSTRAINT [pk_USNO_objID] PRIMARY KEY CLUSTERED([OBJID] ASC) 
 
ALTER TABLE [dbo].[Versions] ADD CONSTRAINT [pk_Versions_version] PRIMARY KEY CLUSTERED([version] ASC) 
 
ALTER TABLE [dbo].[WISE_allsky] ADD CONSTRAINT [pk_WISE_allsky_cntr] PRIMARY KEY CLUSTERED([cntr] ASC) 
 
ALTER TABLE [dbo].[WISE_xmatch] ADD CONSTRAINT [pk_WISE_xmatch_sdss_objID_wise_c] PRIMARY KEY CLUSTERED([sdss_objid] ASC, [wise_cntr] ASC) 
 
ALTER TABLE [dbo].[wiseForcedTarget] ADD CONSTRAINT [pk_wiseForcedTarget_objID] PRIMARY KEY CLUSTERED([objID] ASC) 
 
ALTER TABLE [dbo].[Zone] ADD CONSTRAINT [pk_Zone_zoneID_ra_objID] PRIMARY KEY CLUSTERED([zoneID] ASC, [ra] ASC, [objID] ASC) 
 
ALTER TABLE [dbo].[zoo2MainPhotoz] ADD CONSTRAINT [pk_zoo2MainPhotoz_dr7objid] PRIMARY KEY CLUSTERED([dr7objid] ASC) 
 
ALTER TABLE [dbo].[zoo2MainSpecz] ADD CONSTRAINT [pk_zoo2MainSpecz_dr7objid] PRIMARY KEY CLUSTERED([dr7objid] ASC) 
 
ALTER TABLE [dbo].[zoo2Stripe82Coadd1] ADD CONSTRAINT [pk_zoo2Stripe82Coadd1_stripe82ob] PRIMARY KEY CLUSTERED([stripe82objid] ASC) 
 
ALTER TABLE [dbo].[zoo2Stripe82Coadd2] ADD CONSTRAINT [pk_zoo2Stripe82Coadd2_stripe82ob] PRIMARY KEY CLUSTERED([stripe82objid] ASC) 
 
ALTER TABLE [dbo].[zoo2Stripe82Normal] ADD CONSTRAINT [pk_zoo2Stripe82Normal_dr7objid] PRIMARY KEY CLUSTERED([dr7objid] ASC) 
 
ALTER TABLE [dbo].[zooConfidence] ADD CONSTRAINT [pk_zooConfidence_specObjID] PRIMARY KEY CLUSTERED([specobjid] ASC) 
 
ALTER TABLE [dbo].[zooMirrorBias] ADD CONSTRAINT [pk_zooMirrorBias_dr7objid] PRIMARY KEY CLUSTERED([dr7objid] ASC) 
 
ALTER TABLE [dbo].[zooMonochromeBias] ADD CONSTRAINT [pk_zooMonochromeBias_dr7objid] PRIMARY KEY CLUSTERED([dr7objid] ASC) 
 
ALTER TABLE [dbo].[zooNoSpec] ADD CONSTRAINT [pk_zooNoSpec_dr7objid] PRIMARY KEY CLUSTERED([dr7objid] ASC) 
 
ALTER TABLE [dbo].[zooSpec] ADD CONSTRAINT [pk_zooSpec_specObjID] PRIMARY KEY CLUSTERED([specobjid] ASC) 
 
ALTER TABLE [dbo].[zooVotes] ADD CONSTRAINT [pk_zooVotes_dr7objid] PRIMARY KEY CLUSTERED([dr7objid] ASC) 
 