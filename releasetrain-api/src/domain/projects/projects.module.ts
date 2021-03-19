import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Project } from './project.entity';
import { ProjectsRepository } from './projects.repository';
import { ProjectsService } from './projects.service';

@Module({
    imports: [TypeOrmModule.forFeature([Project])],
    providers: [ProjectsService, ProjectsRepository],
    exports: [ProjectsService],
})
export class ProjectsModule {}
